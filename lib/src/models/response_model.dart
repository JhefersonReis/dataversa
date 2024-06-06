import 'package:isar/isar.dart';

part 'response_model.g.dart';

@collection
class Response {
  Id id = Isar.autoIncrement;
  int? updateId;
  int surveyId;
  int? syncAt;
  double geoLatitude;
  double geoLongitude;
  int timestamp;

  factory Response.fromMap(Map<String, dynamic> map) {
    return Response(
      id: map['id'] as Id,
      updateId: map['update_id'] as int?,
      surveyId: map['survey_id'] as int,
      syncAt: map['sync_at'] as int?,
      geoLatitude: map['geo_latitude'] as double,
      geoLongitude: map['geo_longitude'] as double,
      timestamp: map['timestamp'] as int,
    );
  }

  Response({
    required this.id,
    this.updateId,
    required this.surveyId,
    this.syncAt,
    required this.geoLatitude,
    required this.geoLongitude,
    required this.timestamp,
  });
}
