import 'dart:convert';

import 'package:dataversa/src/models/answer_model.dart';
import 'package:dataversa/src/models/question_model.dart';
import 'package:dataversa/src/models/question_properties_model.dart';
import 'package:dataversa/src/models/survey_model.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';

class FormController {
  Future<FormStructure> getSurveyForm(int sid) async {
    final isar = Isar.getInstance();

    // Fetch survey details
    final survey = await isar!.surveys.filter().sidEqualTo(sid).findFirst();

    if (survey == null) {
      throw Exception('Survey not found');
    }

    // Fetch all questions related to the survey
    final questions = await isar.questions.filter().sidEqualTo(sid).sortByQuestionOrder().findAll();

    final questionProperties = await isar.questionProperties.filter().sidEqualTo(sid).findAll();

    // Organize questions by groups
    final Map<int, FormGroup> groupsMap = {};
    final Map<int, FormQuestion> questionsMap = {};

    for (final question in questions) {
      if (!groupsMap.containsKey(question.gid)) {
        groupsMap[question.gid] = FormGroup(
          groupId: question.gid,
          name: '',
          description: '',
          order: question.questionOrder,
          questions: [],
        );
      }

      // ignore: unnecessary_null_comparison
      if (question.qid == null) {
        continue; // Skip the question if questionId is null
      }

      final formQuestion = FormQuestion(
        questionId: question.qid,
        question: question.question,
        title: question.title,
        type: question.type,
        themeName: question.questionThemeName,
        mandatory: question.mandatory == 'Y',
        order: question.questionOrder,
        maxNumOfFiles: null,
        subQuestions: [],
        answerOptions: [],
        availableAnswers: [],
        imagePaths: [],
      );

      if (question.type == 'T' || question.type == 'S' || question.type == 'N') {
        formQuestion.textController = TextEditingController();
      }

      // Find corresponding question properties
      final properties = questionProperties.firstWhere((prop) => prop.qid == question.qid);

      formQuestion.maxNumOfFiles = properties.maxNumOfFiles;

      if (properties.answerOptions != "No available answer options") {
        formQuestion.answerOptions = parseAnswerOptions(properties.answerOptions);
      }
      if (properties.subquestions != "No available answers") {
        formQuestion.subQuestions = parseSubQuestions(properties.subquestions);
      }
      if (properties.availableAnswers != "No available answers") {
        formQuestion.availableAnswers = parseAvailableAnswers(properties.availableAnswers);
      }

      questionsMap[question.qid] = formQuestion;

      if (question.parentQid == 0) {
        groupsMap[question.gid]!.questions.add(formQuestion);
      }
    }

    // Second pass: associate subquestions with their parent questions
    for (final question in questions) {
      if (question.parentQid != 0) {
        final parentQuestion = questionsMap[question.parentQid];
        if (parentQuestion != null) {
          final subQuestion = SubQuestion(
            key: question.qid.toString(),
            question: question.question,
            title: question.title,
          );

          if (!parentQuestion.subQuestions.any((sq) => sq.key == subQuestion.key)) {
            parentQuestion.subQuestions.add(subQuestion);
          }
        }
      }
    }

    final formGroups = groupsMap.values.toList();

    return FormStructure(
      surveyId: survey.sid,
      title: survey.surveylsTitle,
      startDate: survey.startdate,
      expires: survey.expires,
      form: formGroups,
    );
  }

  Future<void> saveAnswers(FormStructure formStructure, int responseId) async {
    final isar = Isar.getInstance();

    final answersToSave = <Answer>[];
    final answersToUpdate = <Answer>[];

    for (final group in formStructure.form) {
      for (final question in group.questions) {
        // Coletar a resposta com base no tipo de questão
        switch (question.type) {
          case 'T' || 'S' || 'N': // Número ou Texto
            final textValue = question.textController?.text;
            if (textValue != null && textValue.isNotEmpty) {
              final existingAnswer = await isar!.answers
                  .filter()
                  .responseIdEqualTo(responseId)
                  .and()
                  .questionIdEqualTo(question.questionId)
                  .findFirst();

              if (existingAnswer != null) {
                existingAnswer.value = textValue;
                answersToUpdate.add(existingAnswer);
              } else {
                answersToSave.add(
                  Answer(
                    id: Isar.autoIncrement,
                    responseId: responseId,
                    questionId: question.questionId,
                    value: textValue,
                    other: '',
                  ),
                );
              }
            }
            break;
          case 'M': // Múltipla escolha (checkbox)
            for (final subQuestion in question.subQuestions) {
              if (subQuestion.isSelected) {
                final existingAnswer = await isar!.answers
                    .filter()
                    .responseIdEqualTo(responseId)
                    .and()
                    .questionIdEqualTo(question.questionId)
                    .and()
                    .valueEqualTo(subQuestion.title)
                    .findFirst();

                if (existingAnswer != null) {
                  existingAnswer.value = subQuestion.title;
                  answersToUpdate.add(existingAnswer);
                } else {
                  answersToSave.add(
                    Answer(
                      id: Isar.autoIncrement,
                      responseId: responseId,
                      questionId: question.questionId,
                      value: subQuestion.title,
                      other: '',
                    ),
                  );
                }
              }
            }
            break;
          case 'L': // Rádio (listradio)
            final selectedAnswer = question.selectedRadioOption;
            if (selectedAnswer != null && selectedAnswer.isNotEmpty) {
              final existingAnswer = await isar!.answers
                  .filter()
                  .responseIdEqualTo(responseId)
                  .and()
                  .questionIdEqualTo(question.questionId)
                  .and()
                  .valueEqualTo(selectedAnswer)
                  .findFirst();

              if (existingAnswer != null) {
                existingAnswer.value = selectedAnswer;
                answersToUpdate.add(existingAnswer);
              } else {
                answersToSave.add(
                  Answer(
                    id: Isar.autoIncrement,
                    responseId: responseId,
                    questionId: question.questionId,
                    value: selectedAnswer,
                    other: '',
                  ),
                );
              }
            }
            break;
          case '|': // Foto
            if (question.imagePaths.isNotEmpty) {
              for (final imagePath in question.imagePaths) {
                if (imagePath != null && imagePath.isNotEmpty) {
                  final existingAnswer = await isar!.answers
                      .filter()
                      .responseIdEqualTo(responseId)
                      .and()
                      .questionIdEqualTo(question.questionId)
                      .findFirst();

                  if (existingAnswer != null) {
                    existingAnswer.value = imagePath;
                    answersToUpdate.add(existingAnswer);
                  } else {
                    answersToSave.add(
                      Answer(
                        id: Isar.autoIncrement,
                        responseId: responseId,
                        questionId: question.questionId,
                        value: imagePath,
                        other: '',
                      ),
                    );
                  }
                }
              }
            }
            break;
        }
      }
    }

    // Salvar as respostas no banco de dados
    await isar!.writeTxn(() async {
      await isar.answers.putAll(answersToSave);
      await isar.answers.putAll(answersToUpdate);
    });
  }

  Future<List<Answer>> loadAnswers(int responseId) async {
    final isar = Isar.getInstance();
    return await isar!.answers.filter().responseIdEqualTo(responseId).findAll();
  }

  Future<void> loadFormData(int responseId, List<FormQuestion> questions) async {
    final isar = Isar.getInstance();
    final answers = await isar!.answers.filter().responseIdEqualTo(responseId).findAll();

    for (var answer in answers) {
      final question = questions.firstWhere((q) => q.questionId == answer.questionId);
      switch (question.type) {
        case 'T' || 'S' || 'N': // Número ou Texto
          // question.textController = TextEditingController(text: answer.value);
          question.textController?.text = answer.value;
          break;
        case 'M':
          for (var subQuestion in question.subQuestions) {
            if (subQuestion.title == answer.value) {
              subQuestion.isSelected = true;
            }
          }
          break;
        case 'L':
          question.selectedRadioOption = answer.value;
          break;
        case '|':
          question.imagePaths.add(answer.value);
          break;
        default:
          break;
      }
    }
  }
}

List<AnswerOption> parseAnswerOptions(String answerOptionsJson) {
  final decoded = jsonDecode(answerOptionsJson);

  if (decoded is Map<String, dynamic>) {
    // Caso seja um mapa
    return decoded.entries.map((entry) {
      final key = entry.key;
      final value = entry.value;
      return AnswerOption(
        key: key,
        answer: value['answer'],
        order: value['order'],
      );
    }).toList();
  } else if (decoded is List) {
    // Caso seja uma lista
    return decoded.map((item) => AnswerOption.fromJson(item)).toList();
  } else {
    return [];
  }
}

List<AvailableAnswer> parseAvailableAnswers(String availableAnswers) {
  final decoded = json.decode(availableAnswers) as Map<String, dynamic>;
  return decoded.entries.map((entry) => AvailableAnswer(key: entry.key, answer: entry.value)).toList();
}

List<SubQuestion> parseSubQuestions(String subquestions) {
  final decoded = json.decode(subquestions) as Map<String, dynamic>;
  return decoded.entries.map((entry) {
    final subQuestion = entry.value as Map<String, dynamic>;
    return SubQuestion(
      key: entry.key,
      question: subQuestion['question'] ?? '',
      title: subQuestion['title'] ?? '',
    );
  }).toList();
}

class FormStructure {
  final int surveyId;
  final String title;
  final String? startDate;
  final String? expires;
  final List<FormGroup> form;

  FormStructure({
    required this.surveyId,
    required this.title,
    this.startDate,
    this.expires,
    required this.form,
  });
}

class SubQuestion {
  final String key;
  final String question;
  final String title;
  bool isSelected;

  factory SubQuestion.fromJson(Map<String, dynamic> json) {
    return SubQuestion(
      key: json['key'] ?? '',
      question: json['question'] ?? '',
      title: json['title'] ?? '',
      isSelected: json['isSelected'] ?? false,
    );
  }

  SubQuestion({required this.key, required this.question, required this.title, this.isSelected = false});
}

class FormGroup {
  final int groupId;
  final String name;
  final String description;
  final int order;
  final List<FormQuestion> questions;

  FormGroup({
    required this.groupId,
    required this.name,
    required this.description,
    required this.order,
    required this.questions,
  });
}

class AvailableAnswer {
  final String key;
  final String answer;
  bool isSelected;

  AvailableAnswer({
    required this.key,
    required this.answer,
    this.isSelected = false,
  });

  factory AvailableAnswer.fromJson(Map<String, dynamic> json) {
    return AvailableAnswer(
      key: json['key'] ?? '',
      answer: json['answer'] ?? '',
      isSelected: json['isSelected'] ?? false,
    );
  }
}

class FormQuestion {
  final int questionId;
  final String question;
  final String title;
  final String type;
  final String themeName;
  final bool mandatory;
  final int order;
  String? maxNumOfFiles;
  TextEditingController? textController;
  String? selectedRadioOption;
  Map<String, bool>? selectedCheckboxes;
  List<String?> imagePaths = [];
  List<SubQuestion> subQuestions;
  List<AvailableAnswer> availableAnswers;
  List<AnswerOption> answerOptions;

  FormQuestion({
    required this.questionId,
    required this.question,
    required this.title,
    required this.type,
    required this.themeName,
    required this.mandatory,
    required this.order,
    this.maxNumOfFiles,
    required this.subQuestions,
    required this.answerOptions,
    required this.availableAnswers,
    this.textController,
    this.selectedRadioOption,
    this.selectedCheckboxes,
    required this.imagePaths,
  });

  factory FormQuestion.fromJson(Map<String, dynamic> json) {
    return FormQuestion(
      questionId: json['questionId'] as int? ?? 0,
      question: json['question'] as String? ?? '',
      title: json['title'] as String? ?? '',
      type: json['type'] as String? ?? '',
      themeName: json['themeName'] as String? ?? '',
      mandatory: json['mandatory'] as bool? ?? false,
      order: json['order'] as int? ?? 0,
      maxNumOfFiles: json['maxNumOfFiles'] as String?,
      subQuestions: (json['subQuestions'] as List<dynamic>?)
              ?.map((item) => SubQuestion.fromJson(item as Map<String, dynamic>))
              .toList() ??
          [],
      answerOptions: (json['answerOptions'] as List<dynamic>?)
              ?.map((item) => AnswerOption.fromJson(item as Map<String, dynamic>))
              .toList() ??
          [],
      availableAnswers: (json['availableAnswers'] as List<dynamic>?)
              ?.map((item) => AvailableAnswer.fromJson(item as Map<String, dynamic>))
              .toList() ??
          [],
      imagePaths: [],
    );
  }
}

class AnswerOption {
  final String key;
  String answer;
  final int? order;
  bool isSelected;

  AnswerOption({
    required this.key,
    required this.answer,
    this.order,
    this.isSelected = false,
  });

  AnswerOption copyWith({
    String? key,
    String? answer,
    int? order,
    bool? isSelected,
  }) {
    return AnswerOption(
      key: key ?? this.key,
      answer: answer ?? this.answer,
      order: order ?? this.order,
      isSelected: isSelected ?? this.isSelected,
    );
  }

  factory AnswerOption.fromJson(Map<String, dynamic> json) {
    return AnswerOption(
      key: json['key'],
      answer: json['answer'] as String,
      order: json['order'] as int,
      isSelected: json['isSelected'] as bool? ?? false,
    );
  }
}
