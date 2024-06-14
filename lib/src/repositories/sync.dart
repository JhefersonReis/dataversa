import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dataversa/src/commom/rest_client.dart';
import 'package:dataversa/src/controllers/auth_controller.dart';
import 'package:dataversa/src/controllers/connection_controller.dart';
import 'package:dataversa/src/controllers/survey_controller.dart';
import 'package:dataversa/src/database/database.dart';
import 'package:dataversa/src/helpers/helpers.dart';
import 'package:dataversa/src/models/answer_model.dart';
import 'package:dataversa/src/models/question_model.dart';
import 'package:dataversa/src/models/question_properties_model.dart';
import 'package:dataversa/src/models/response_model.dart';
import 'package:dataversa/src/models/session_key_model.dart';
import 'package:dataversa/src/models/survey_model.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:signals/signals_flutter.dart';
import 'package:path/path.dart' as path;

class SyncFromServer {
  final loading = signal(false);
  final connection = GetIt.I.get<ConnectionController>();
  final surveyController = GetIt.I.get<SurveyController>();
  final database = GetIt.I.get<Database>();
  final client = GetIt.I.get<RestClient>();

  Helpers helpers = Helpers();

  Future<void> syncData() async {
    loading.set(true);

    await connection.checkConnection();
    if (!connection.isConnected) {
      loading.set(false);
      helpers.showToastMessage(message: 'Sem conexão com a internet!', isError: true);
      return;
    }

    // Fetch data
    await listSurveys(database);
    await listQuestions();
    await questionProperties();

    surveyController.getSurveys();

    loading.set(false);
  }

  // Future<void> sendToServer({
  //   required Isar isar,
  //   required FormRequest formRequest,
  //   required int surveyId,
  //   required String sessionKey,
  // }) async {
  //   final client = GetIt.I.get<RestClient>();
  //   const randomId = 1;
  //   try {
  //     final Map<String, dynamic> save = {};
  //     for (final answerRequest in formRequest.answers) {
  //       if (answerRequest.questionType == 'file_upload') {
  //         int attemps = 0;
  //         const maxAttemps = 3;
  //         while (attemps < maxAttemps) {
  //           attemps++;
  //           try {
  //             final img = await File(answerRequest.questionValue).readAsBytes();
  //             final base64Image = base64Encode(img);
  //             final fileName = path.basename(answerRequest.questionValue);
  //             final response = await client.post(
  //               '',
  //               data: {
  //                 'method': 'upload_file',
  //                 'params': [sessionKey, surveyId, answerRequest.questionCode, fileName, base64Image],
  //                 'id': randomId,
  //               },
  //             );
  //             final data = jsonDecode(response.data);
  //             if (data['result']['success']) {
  //               if (save.containsKey(answerRequest.questionCode)) {
  //                 save[answerRequest.questionCode] = jsonEncode([
  //                   ...jsonDecode(save[answerRequest.questionCode]),
  //                   {
  //                     'title': '',
  //                     'comment': '',
  //                     'size': data['result']['size'],
  //                     'name': data['result']['name'],
  //                     'filename': data['result']['filename'],
  //                     'ext': data['result']['ext'],
  //                   }
  //                 ]);
  //               } else {
  //                 save[answerRequest.questionCode] = jsonEncode([
  //                   {
  //                     'title': '',
  //                     'comment': '',
  //                     'size': data['result']['size'],
  //                     'name': data['result']['name'],
  //                     'filename': data['result']['filename'],
  //                     'ext': data['result']['ext'],
  //                   }
  //                 ]);
  //               }
  //               break;
  //             } else {
  //               throw Exception('Erro ao tentar enviar imagem: ${data['result']['msg']}');
  //             }
  //           } catch (e) {
  //             log('sendToServer: ${e.toString()}');
  //             if (attemps < maxAttemps) {
  //               helpers.showToastMessage(
  //                 message: 'Erro ao tentar enviar imagem, tentando novamente...',
  //                 isError: true,
  //               );
  //               await Future.delayed(const Duration(seconds: 2));
  //             } else {
  //               throw Exception('Erro ao tentar enviar imagem: ${e.toString()}');
  //             }
  //           }
  //         }
  //       } else if (answerRequest.questionType == 'multiplechoice') {}
  //     }
  //   } catch (e) {
  //     log('sendToServer: ${e.toString()}');
  //   }
  // }

  // Future<List<Map<String, dynamic>>> _fetchData(Database database) async {
  //   final responsesToSend = await database.isar.responses.filter().syncAtIsNull().and().needSyncEqualTo(true).findAll();
  //   List<Map<String, dynamic>> result = [];
  //   for (final response in responsesToSend) {
  //     final survey = await database.isar.surveys.where().filter().sidEqualTo(response.surveyId).findFirst();
  //     final questions = await database.isar.questions
  //         .where()
  //         .filter()
  //         .sidEqualTo(survey!.sid)
  //         .and()
  //         .titleContains('GEOLOCALIZACAO')
  //         .and()
  //         .titleContains('USUARIO')
  //         .findAll();
  //     for (final question in questions) {
  //       result.add({
  //         'update_id': response.updateId,
  //         'survey_id': survey.sid,
  //         'survey_title': survey.surveylsTitle,
  //         'survey_startdate': survey.startdate,
  //         'survey_expires': survey.expires,
  //         'response_id': response.id,
  //         'question_code': '${survey.sid}X${question.gid}X${question.qid}',
  //         'question_type': question.questionThemeName,
  //         'question_id': question.id,
  //         'question_value': question.title == 'GEOLOCALIZACAO'
  //             ? 'latitude: ${response.geoLatitude}; longitude: ${response.geoLongitude}; altitude: ${response.geoLatitude};'
  //             : 'usuario',
  //         'question_other': '',
  //       });
  //     }
  //     final answers = await database.isar.answers.filter().responseIdEqualTo(response.id).findAll();
  //     for (final answer in answers) {
  //       final question = await database.isar.questions.where().idEqualTo(answer.questionId).findFirst();
  //       result.add({
  //         'update_id': response.updateId,
  //         'survey_id': survey.sid,
  //         'survey_title': survey.surveylsTitle,
  //         'survey_startdate': survey.startdate,
  //         'survey_expires': survey.expires,
  //         'response_id': response.id,
  //         'question_code': '${survey.sid}X${question!.gid}X${question.qid}',
  //         'question_type': question.questionThemeName,
  //         'question_id': question.id,
  //         'question_value': answer.value,
  //         'question_other': answer.other,
  //       });
  //     }
  //   }
  //   return result;
  // }

  Future<void> uploadData() async {
    try {
      final dataRequest = <RequestSurvey>[];

      // Obtenha os dados do banco de dados Isar
      final responsesToSend =
          await database.isar.responses.filter().syncAtIsNull().and().needSyncEqualTo(true).findAll();

      // if (responsesToSend.isEmpty) {
      //   uploadDataLoading = false;
      //   return;
      // }

      // Processar os dados para a estrutura de dados necessária
      for (final response in responsesToSend) {
        final survey = await database.isar.surveys.where().sidEqualTo(response.surveyId).findFirst();
        if (survey == null) continue;

        final questions = await database.isar.questions.filter().sidEqualTo(survey.sid).findAll();
        final answers = await database.isar.answers.filter().responseIdEqualTo(response.id).findAll();

        final indexSurvey = dataRequest.indexWhere((item) => item.surveyId == survey.sid);
        if (indexSurvey < 0) {
          dataRequest.add(RequestSurvey(
            surveyId: survey.sid,
            title: survey.surveylsTitle,
            expires: survey.expires,
            startDate: survey.startdate,
            responses: [],
          ));
        }

        final surveyItem = dataRequest[indexSurvey >= 0 ? indexSurvey : dataRequest.length - 1];
        final indexResponse = surveyItem.responses.indexWhere((item) => item.responseId == response.id);
        final usuario = await database.isar.sessionKeys.where().findFirst();
        if (indexResponse < 0) {
          surveyItem.responses.add(FormResponse(
            updateId: response.updateId,
            altitude: response.geoAltitude,
            latitude: response.geoLatitude,
            longitude: response.geoLongitude,
            usuario: usuario!.user,
            responseId: response.id,
            timestamp: response.timestamp,
            answers: [],
          ));
        }

        final responseItem = surveyItem.responses[indexResponse >= 0 ? indexResponse : surveyItem.responses.length - 1];
        for (final question in questions) {
          if (question.title == 'GEOLOCALIZACAO' || question.title == 'USUARIO') {
            responseItem.answers.add(FormAnswer(
              questionCode: '${survey.sid}X${question.gid}X${question.qid}',
              questionId: question.id,
              questionType: question.questionThemeName,
              questionValue: question.title == 'GEOLOCALIZACAO'
                  ? 'latitude: ${response.geoLatitude}; longitude: ${response.geoLongitude}; altitude: ${response.geoAltitude};'
                  : usuario!.user,
              questionOther: '',
            ));
          }
        }

        for (final answer in answers) {
          final question = questions.firstWhere((q) => q.id == answer.questionId,
              orElse: () => throw Exception('Question not found'));
          responseItem.answers.add(FormAnswer(
            questionCode: '${survey.sid}X${question.gid}X${question.qid}',
            questionId: question.id,
            questionType: question.questionThemeName,
            questionValue: answer.value,
            questionOther: answer.other,
          ));
        }
      }

      // Enviar os dados
      int count = 0;
      for (final surveyRequest in dataRequest) {
        for (final formRequest in surveyRequest.responses) {
          if (++count % 5 == 0) {
            await Future.delayed(const Duration(seconds: 10));
          }

          await send(surveyRequest, formRequest);
        }
      }
    } catch (e) {
      print('uploadError: $e');
      // Exibir uma mensagem de erro usando alguma biblioteca de UI, como o Flutter Toast
    }
  }

  Future<void> send(RequestSurvey surveyRequest, FormResponse formRequest) async {
    var save = <String, dynamic>{};
    final sessionKey = computed(() => database.isar.sessionKeys.where().findFirstSync()!.sessionKey);

    for (final answer in formRequest.answers) {
      if (answer.questionType == 'file_upload') {
        int attemps = 0;
        const maxAttemps = 3;
        while (attemps < maxAttemps) {
          attemps++;
          try {
            final img = await File(answer.questionValue).readAsBytes();
            final base64Image = base64Encode(img);
            final fileName = path.basename(answer.questionValue);
            final response = await client.post(
              '',
              data: {
                'method': 'upload_file',
                'params': [sessionKey.value, surveyRequest.surveyId, answer.questionCode, fileName, base64Image],
                'id': 1,
              },
            );

            final data = jsonDecode(response.data);
            if (data['result']['success']) {
              if (save.containsKey(answer.questionCode)) {
                save[answer.questionCode] = jsonEncode([
                  ...jsonDecode(save[answer.questionCode]),
                  {
                    'title': '',
                    'comment': '',
                    'size': data['result']['size'],
                    'name': data['result']['name'],
                    'filename': data['result']['filename'],
                    'ext': data['result']['ext'],
                  }
                ]);
              } else {
                save[answer.questionCode] = jsonEncode([
                  {
                    'title': '',
                    'comment': '',
                    'size': data['result']['size'],
                    'name': data['result']['name'],
                    'filename': data['result']['filename'],
                    'ext': data['result']['ext'],
                  }
                ]);
              }
              break;
            } else {
              throw Exception('Erro ao tentar enviar imagem: ${data['result']['msg']}');
            }
          } catch (e) {
            log('send image: ${e.toString()}');
            if (attemps < maxAttemps) {
              helpers.showToastMessage(
                message: 'Erro ao tentar enviar imagem, tentativa $attemps de $maxAttemps...',
                isError: true,
              );
              await Future.delayed(const Duration(seconds: 2));
            } else {
              throw Exception('Erro ao tentar enviar imagem: ${e.toString()}');
            }
          }
        }
      } else {
        if (answer.questionType == 'multiplechoice') {
          // save[answer.questionCode] = answer.questionValue == 'other' ? '-oth-' : answer.questionValue;
          save['${answer.questionCode}${answer.questionValue}'] = 'Y';

          if (answer.questionValue == 'other') {
            save['${answer.questionCode}other'] = answer.questionOther;
          }
          continue;
        }

        save[answer.questionCode] = answer.questionValue == 'other' ? '-oth-' : answer.questionValue;

        if (answer.questionValue == 'other' && answer.questionType == 'listradio') {
          save['${answer.questionCode}other'] = answer.questionOther;
        }

        // if (answer.questionValue == 'other') {
        //   save['${answer.questionCode}other'] = answer.questionOther;
        // }
      }
    }

    final postData = {
      'method': 'add_response',
      'params': [sessionKey, surveyRequest.surveyId, save],
      'id': 1
    };

    // if (formRequest.updateId != null) {
    //   // Deletar a resposta existente se update_id estiver presente
    //   final deleteData = {
    //     'method': 'delete_response',
    //     'params': [sessionKey, surveyRequest.surveyId, formRequest.updateId],
    //     'id': 1
    //   };

    //   final deleteResponse = await client.post('', data: deleteData);
    //   final deleteDataResponse = jsonDecode(deleteResponse.data);

    //   if (deleteDataResponse['result'] == 'Survey does not allow edit after completion') {
    //     throw Exception('A opção de atualização de formulários preenchidos está desativada na plataforma.');
    //   }
    // }

    final response = await client.post('', data: postData);
    final data = jsonDecode(response.data);

    final success = int.parse(data['result']).runtimeType == int;

    log('resultado send: ${data['result'].runtimeType}');

    if (!success && data['result']['status'] == 'Invalid session key') {
      final authController = GetIt.I.get<AuthController>();
      await authController.refreshSessionKey();
      return send(surveyRequest, formRequest);
    }
    log('send: ${response.data.toString()}');

    if (data['result'] != null && success) {
      // Atualizar a resposta como sincronizada no banco de dados Isar
      await database.isar.writeTxn(
        () async {
          final responseToUpdate = await database.isar.responses.get(formRequest.responseId);
          if (responseToUpdate != null) {
            responseToUpdate.syncAt = DateTime.now().millisecondsSinceEpoch;
            responseToUpdate.needSync = false;
            await database.isar.responses.put(responseToUpdate);
          }
        },
      );
    } else {
      throw Exception('Erro ao tentar enviar registro: ${response.data['result']}');
    }
  }

  Future<void> listSurveys(Database database) async {
    try {
      final client = GetIt.I.get<RestClient>();
      final sessionKey = computed(() => database.isar.sessionKeys.where().findFirstSync()!.sessionKey);

      final response = await client.post(
        '',
        data: {
          'method': 'list_surveys',
          'params': [
            sessionKey.value,
          ],
          'id': 1,
        },
      );
      final decode = jsonDecode(response.data);

      if (decode['result'].runtimeType != List) {
        log('Session key expired');
        final authController = GetIt.I.get<AuthController>();
        await authController.refreshSessionKey();
        return syncData();
      }

      final surveys = decode['result'] as List;

      for (final survey in surveys) {
        final saveSurvey = Survey.fromMap(survey as Map<String, dynamic>);
        await database.isar.writeTxn(() => database.isar.surveys.put(saveSurvey));
      }

      log('listSurveys: ${response.data.toString()}');
    } catch (e) {
      log('listSurveys: ${e.toString()}');
    }
  }

  Future<void> listQuestions() async {
    try {
      final client = GetIt.I.get<RestClient>();
      final sessionKey = computed(() => database.isar.sessionKeys.where().findFirstSync()!.sessionKey);
      final surveys = await database.isar.surveys.where().findAll();

      for (final survey in surveys) {
        final response = await client.post(
          '',
          data: {
            'method': 'list_questions',
            'params': [
              sessionKey.value,
              survey.sid,
            ],
            'id': 1,
          },
        );
        final decode = jsonDecode(response.data);
        final questions = decode['result'] as List;

        for (final question in questions) {
          final saveQuestion = Question.fromMap(question as Map<String, dynamic>);
          await database.isar.writeTxn(() => database.isar.questions.put(saveQuestion));
        }
      }
    } catch (e) {
      log('listQuestions: ${e.toString()}');
    }
  }

  Future<void> questionProperties() async {
    try {
      final client = GetIt.I.get<RestClient>();
      final sessionKey = computed(() => database.isar.sessionKeys.where().findFirstSync()!.sessionKey);
      final questions = await database.isar.questions.where().findAll();

      for (final question in questions) {
        final response = await client.post(
          '',
          data: {
            'method': 'get_question_properties',
            'params': [
              sessionKey.value,
              question.id,
            ],
            'id': 1,
          },
        );

        final decode = jsonDecode(response.data);
        final properties = QuestionProperties.fromMap(decode['result']);

        await database.isar.writeTxn(() async {
          await database.isar.questionProperties.put(properties);
        });
      }
    } catch (e) {
      log('questionProperties: ${e.toString()}');
    }
  }
}

bool isNaN(int i) {
  return i.isNaN;
}

class FormRequest {
  final List<AnswerRequest> answers;
  final String? updateId;
  final String responseId;

  FormRequest({required this.answers, this.updateId, required this.responseId});
}

class AnswerRequest {
  final String questionType;
  final String questionValue;
  final String questionCode;
  final String? questionOther;

  AnswerRequest({
    required this.questionType,
    required this.questionValue,
    required this.questionCode,
    this.questionOther,
  });
}

class ItemRequest {
  final String surveyId;

  ItemRequest({required this.surveyId});
}

class RequestSurvey {
  int surveyId;
  String title;
  String? expires;
  String? startDate;
  List<FormResponse> responses;

  RequestSurvey({
    required this.surveyId,
    required this.title,
    this.expires,
    this.startDate,
    required this.responses,
  });
}

class FormResponse {
  int? updateId;
  double altitude;
  double latitude;
  double longitude;
  String? precisao;
  String? usuario;
  int responseId;
  String? status;
  int? timestamp;
  List<FormAnswer> answers;

  FormResponse({
    this.updateId,
    required this.altitude,
    required this.latitude,
    required this.longitude,
    this.precisao,
    this.usuario,
    required this.responseId,
    this.status,
    this.timestamp,
    required this.answers,
  });
}

class FormAnswer {
  String questionCode;
  int questionId;
  String questionType;
  String questionValue;
  String? questionOther;

  FormAnswer({
    required this.questionCode,
    required this.questionId,
    required this.questionType,
    required this.questionValue,
    this.questionOther,
  });
}
