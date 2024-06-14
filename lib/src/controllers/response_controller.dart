import 'dart:developer';

import 'package:dataversa/src/controllers/geolocation_controller.dart';
import 'package:dataversa/src/database/database.dart';
import 'package:dataversa/src/models/response_model.dart';
import 'package:get_it/get_it.dart';
import 'package:isar/isar.dart';
import 'package:signals/signals_flutter.dart';

class ResponseController {
  final _responses = signal<List<Response>>([]);
  final _loading = signal(false);
  final locationController = GetIt.I.get<GeolocationController>();
  final database = GetIt.I<Database>();

  List<Response> get responses => _responses.value;
  bool get loading => _loading.value;

  Future<Map<String, Object?>> createResponse(int sid) async {
    _loading.set(true);
    final location = await locationController.determinePosition();

    late int id;
    await database.isar.writeTxn(() async {
      final response = Response(
        id: Isar.autoIncrement, // O Isar vai definir o ID automaticamente.
        surveyId: sid,
        geoLatitude: location.latitude,
        geoLongitude: location.longitude,
        geoAltitude: location.altitude,
        timestamp: DateTime.now().millisecondsSinceEpoch,
      );

      id = await database.isar.responses.put(response); // O ID gerado é retornado.
    });

    final newResponse = await database.isar.responses.get(id);
    if (newResponse != null) {
      _responses.value.add(newResponse);
    } else {
      log('Error: Failed to retrieve the new response from the database.');
    }
    _loading.set(false);

    return {
      'id': id,
      'surveyId': sid,
      'geoLatitude': location.latitude,
      'geoLongitude': location.longitude,
      'timestamp': newResponse?.timestamp,
    };
  }

  void getResponses(int sid) async {
    _loading.set(true);
    final responses = database.isar.responses.where().filter().surveyIdEqualTo(sid).findAllSync();
    _responses.set(responses);
    _loading.set(false);
  }

  void searchResponses(String value, int sid) {
    if (value.isEmpty) {
      getResponses(sid);
      return;
    }

    final searchValue = value.trim();
    final allResponses = database.isar.responses.where().findAllSync();
    final responses = allResponses.where((response) => response.idString.contains(searchValue)).toList();

    _responses.set(responses);
  }
}
