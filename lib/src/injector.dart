import 'package:dataversa/src/commom/rest_client.dart';
import 'package:dataversa/src/controllers/auth_controller.dart';
import 'package:dataversa/src/controllers/connection_controller.dart';
import 'package:dataversa/src/controllers/form_controller.dart';
import 'package:dataversa/src/controllers/geolocation_controller.dart';
import 'package:dataversa/src/controllers/response_controller.dart';
import 'package:dataversa/src/controllers/survey_controller.dart';
import 'package:dataversa/src/database/database.dart';
import 'package:dataversa/src/repositories/auth_repository.dart';
import 'package:dataversa/src/repositories/sync.dart';
import 'package:get_it/get_it.dart';

final _getIt = GetIt.instance;

void setup() {
  // Commom
  _getIt.registerSingleton<RestClient>(RestClient());
  _getIt.registerSingleton<Database>(Database());

  // Repositories
  _getIt.registerSingleton<AuthRepository>(AuthRepository(client: _getIt<RestClient>()));

  // Controllers
  _getIt.registerSingleton<ConnectionController>(ConnectionController());
  _getIt.registerSingleton<AuthController>(AuthController(authRepository: _getIt<AuthRepository>()));
  _getIt.registerSingleton<SurveyController>(SurveyController());
  _getIt.registerSingleton<GeolocationController>(GeolocationController());
  _getIt.registerSingleton<ResponseController>(ResponseController());
  _getIt.registerSingleton<FormController>(FormController());

  // Sync
  _getIt.registerSingleton<SyncFromServer>(SyncFromServer());
}
