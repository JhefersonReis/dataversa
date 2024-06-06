import 'package:isar/isar.dart';

part 'survey_model.g.dart';

@collection
class Survey {
  Id sid;
  String surveylsTitle;
  String? startdate;
  String? expires;
  String active;

  factory Survey.fromMap(Map<String, dynamic> map) {
    return Survey(
      sid: map['sid'] as Id,
      surveylsTitle: map['surveyls_title'] as String,
      startdate: map['startdate'] as String?,
      expires: map['expires'] as String?,
      active: map['active'] as String,
    );
  }

  Survey({
    required this.sid,
    required this.surveylsTitle,
    this.startdate,
    this.expires,
    required this.active,
  });
}
