import 'dart:convert';
import 'dart:developer';

import 'package:dataversa/src/commom/rest_client.dart';
import 'package:dataversa/src/controllers/connection_controller.dart';
import 'package:dataversa/src/controllers/survey_controller.dart';
import 'package:dataversa/src/models/question_model.dart';
import 'package:dataversa/src/models/question_properties_model.dart';
import 'package:dataversa/src/models/session_key_model.dart';
import 'package:dataversa/src/models/survey_model.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:signals/signals_flutter.dart';

class SyncFromServer {
  final loading = signal(false);
  final connection = GetIt.I.get<ConnectionController>();
  final surveyController = GetIt.I.get<SurveyController>();

  Future<void> syncData() async {
    loading.set(true);

    await connection.checkConnection();
    if (!connection.isConnected) {
      loading.set(false);
      log('No connection');
      return;
    }

    // Fetch data
    await listSurveys();
    await listQuestions();
    await questionProperties();

    surveyController.getSurveys();

    loading.set(false);
  }

  Future<void> listSurveys() async {
    try {
      final isar = Isar.getInstance();
      final client = GetIt.I.get<RestClient>();
      final sessionKey = computed(() => isar!.sessionKeys.where().findFirstSync()!.sessionKey);

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
      final surveys = decode['result'] as List;

      for (final survey in surveys) {
        final saveSurvey = Survey.fromMap(survey as Map<String, dynamic>);
        await isar!.writeTxn(() => isar.surveys.put(saveSurvey));
      }

      log('listSurveys: ${response.data.toString()}');
    } catch (e) {
      log('listSurveys: ${e.toString()}');
    }
  }

  Future<void> listQuestions() async {
    try {
      final isar = Isar.getInstance();
      final client = GetIt.I.get<RestClient>();
      final sessionKey = computed(() => isar!.sessionKeys.where().findFirstSync()!.sessionKey);
      final surveys = await isar!.surveys.where().findAll();

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
          await isar.writeTxn(() => isar.questions.put(saveQuestion));
        }
      }
    } catch (e) {
      log('listQuestions: ${e.toString()}');
    }
  }

  Future<void> questionProperties() async {
    try {
      final isar = Isar.getInstance();
      final client = GetIt.I.get<RestClient>();
      final sessionKey = computed(() => isar!.sessionKeys.where().findFirstSync()!.sessionKey);
      final questions = await isar!.questions.where().findAll();

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

        await isar.writeTxn(() async {
          await isar.questionProperties.put(properties);
        });
      }
    } catch (e) {
      log('questionProperties: ${e.toString()}');
    }
  }
}
