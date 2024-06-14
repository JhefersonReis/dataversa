import 'package:isar/isar.dart';

part 'session_key_model.g.dart';

@collection
class SessionKey {
  Id id = Isar.autoIncrement;
  late String sessionKey;
  late String user;
  late String password;

  SessionKey.fromJson(Map<String, dynamic> json) {
    sessionKey = json['result'];
    user = json['user'];
    password = json['password'];
  }

  SessionKey({required this.sessionKey, required this.user, required this.password});
}
