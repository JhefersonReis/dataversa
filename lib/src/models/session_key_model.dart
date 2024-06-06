import 'package:isar/isar.dart';

part 'session_key_model.g.dart';

@collection
class SessionKey {
  Id id = Isar.autoIncrement;
  late String sessionKey;

  SessionKey.fromJson(Map<String, dynamic> json) {
    sessionKey = json['result'];
  }

  SessionKey({required this.sessionKey});
}
