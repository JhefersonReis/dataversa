import 'package:dataversa/src/models/answer_model.dart';
import 'package:dataversa/src/models/question_model.dart';
import 'package:dataversa/src/models/question_properties_model.dart';
import 'package:dataversa/src/models/response_model.dart';
import 'package:dataversa/src/models/session_key_model.dart';
import 'package:dataversa/src/models/survey_model.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

class Database {
  static Isar? _isarInstance;

  Future<void> initializeDatabase() async {
    // Verifica se a instância já está aberta
    if (_isarInstance != null && _isarInstance!.isOpen) {
      return;
    }

    // Inicializa o banco de dados
    final dir = await getApplicationDocumentsDirectory();
    _isarInstance = await Isar.open([
      SessionKeySchema,
      SurveySchema,
      QuestionSchema,
      QuestionPropertiesSchema,
      AnswerSchema,
      ResponseSchema,
    ], directory: dir.path);
  }

  Isar get isar => _isarInstance!;
}
