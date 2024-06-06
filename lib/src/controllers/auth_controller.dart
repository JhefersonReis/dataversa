import 'package:dataversa/src/controllers/connection_controller.dart';
import 'package:dataversa/src/models/session_key_model.dart';
import 'package:dataversa/src/repositories/auth_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:signals/signals.dart';
import 'package:isar/isar.dart';

class AuthController {
  final AuthRepository authRepository;
  AuthController({required this.authRepository});

  final logged = signal(false);
  final _loading = signal(false);
  final connection = GetIt.I<ConnectionController>();

  bool get loading => _loading.value;

  Future<void> login(String user, String password) async {
    _loading.set(true);

    await connection.checkConnection();
    if (!connection.isConnected) {
      throw Exception('Sem conexão com a internet');
    }

    try {
      final response = await authRepository.login(user, password);

      final isar = Isar.getInstance();
      await isar!.writeTxn(() => isar.sessionKeys.put(SessionKey(sessionKey: response)));
      logged.set(true);
      // log(response.toString());
    } catch (e) {
      rethrow;
    } finally {
      _loading.set(false);
    }
  }

  void logout() async {
    final isar = Isar.getInstance();
    logged.set(false);
    await isar!.writeTxn(() => isar.clear());
  }
}
