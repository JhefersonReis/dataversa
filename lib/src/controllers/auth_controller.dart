import 'dart:developer';

import 'package:dataversa/src/controllers/connection_controller.dart';
import 'package:dataversa/src/database/database.dart';
import 'package:dataversa/src/helpers/helpers.dart';
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
  final database = GetIt.I<Database>();

  Helpers get helper => Helpers();

  bool get loading => _loading.value;

  Future<void> login(String user, String password) async {
    _loading.set(true);

    await connection.checkConnection();
    if (!connection.isConnected) {
      helper.showToastMessage(
        message: 'Sem conexão com a internet!',
        isError: true,
      );
      _loading.set(false);
      return;
    }

    try {
      final response = await authRepository.login(user, password);

      await database.isar.writeTxn(() async {
        await database.isar.sessionKeys.clear();
        await database.isar.sessionKeys.put(
          SessionKey(sessionKey: response, user: user, password: password),
        );
      });
      logged.set(true);
    } catch (e) {
      helper.showErrorMessage(e.toString());
    } finally {
      _loading.set(false);
    }
  }

  Future<void> simulateLogin() async {
    _loading.set(true);

    Future.delayed(const Duration(seconds: 2), () {
      // logged.set(true);
      _loading.set(false);
    });
  }

  Future<void> refreshSessionKey() async {
    final session = await database.isar.sessionKeys.where().findFirst();

    await login(session!.user, session.password);
    // await database.isar.writeTxn(() => database.isar.sessionKeys.delete(session.id));
  }

  void logout() async {
    logged.set(false);
    await database.isar.writeTxn(() => database.isar.clear());
  }
}
