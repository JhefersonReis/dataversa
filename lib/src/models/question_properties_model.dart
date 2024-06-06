import 'dart:convert';

import 'package:isar/isar.dart';

part 'question_properties_model.g.dart';

@collection
class QuestionProperties {
  Id qid;
  int parentQid;
  int sid;
  int gid;
  String type;
  String title;
  String other;
  String? mandatory;
  int questionOrder;
  String questionThemeName;
  String availableAnswers;
  String subquestions;
  String answerOptions;
  String? maxNumOfFiles;

  factory QuestionProperties.fromMap(Map<String, dynamic> map) {
    late final String answerOptions;
    late final String availableAnswers;
    late final String subquestions;

    if (map['answeroptions'] is Map<String, dynamic>) {
      answerOptions = jsonEncode(map['answeroptions']);
    } else {
      answerOptions = map['answeroptions'] as String;
    }

    if (map['available_answers'] is Map<String, dynamic>) {
      availableAnswers = jsonEncode(map['available_answers']);
    } else {
      availableAnswers = map['available_answers'] as String;
    }

    if (map['subquestions'] is Map<String, dynamic>) {
      subquestions = jsonEncode(map['subquestions']);
    } else {
      subquestions = map['subquestions'] as String;
    }

    return QuestionProperties(
      qid: map['qid'] as Id,
      parentQid: map['parent_qid'] as int,
      sid: map['sid'] as int,
      gid: map['gid'] as int,
      type: map['type'] as String,
      title: map['title'] as String,
      other: map['other'] as String,
      mandatory: map['mandatory'] as String?,
      questionOrder: map['question_order'] as int,
      questionThemeName: map['question_theme_name'] as String,
      availableAnswers: availableAnswers,
      subquestions: subquestions,
      answerOptions: answerOptions,
      maxNumOfFiles: map['attributes']['max_num_of_files'] as String?,
    );
  }

  QuestionProperties({
    required this.qid,
    required this.parentQid,
    required this.sid,
    required this.gid,
    required this.type,
    required this.title,
    required this.other,
    this.mandatory,
    required this.questionOrder,
    required this.questionThemeName,
    required this.availableAnswers,
    required this.subquestions,
    required this.answerOptions,
    this.maxNumOfFiles,
  });
}
