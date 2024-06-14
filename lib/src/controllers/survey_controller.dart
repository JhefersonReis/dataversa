import 'package:dataversa/src/database/database.dart';
import 'package:dataversa/src/models/survey_model.dart';
import 'package:get_it/get_it.dart';
import 'package:signals/signals_flutter.dart';
import 'package:isar/isar.dart';

class SurveyController {
  final _surveys = signal<List<Survey>>([]);
  final _loading = signal(false);
  final database = GetIt.I<Database>();

  List<Survey> get surveys => _surveys.value;
  bool get loading => _loading.value;

  void getSurveys() {
    _loading.set(true);
    final surveys = database.isar.surveys.where().findAllSync();
    _surveys.set(surveys);
    _loading.set(false);
  }

  void resetSurveys() {
    _surveys.set([]);
  }
}
