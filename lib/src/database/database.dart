import 'package:dataversa/src/models/answer_model.dart';
import 'package:dataversa/src/models/question_model.dart';
import 'package:dataversa/src/models/question_properties_model.dart';
import 'package:dataversa/src/models/response_model.dart';
import 'package:dataversa/src/models/session_key_model.dart';
import 'package:dataversa/src/models/survey_model.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class Database {
  Future<void> initializeDatabase() async {
    // Initialize database
    final dir = await getApplicationDocumentsDirectory();
    await Isar.open([
      SessionKeySchema,
      SurveySchema,
      QuestionSchema,
      QuestionPropertiesSchema,
      AnswerSchema,
      ResponseSchema,
    ], directory: dir.path);
  }
}
