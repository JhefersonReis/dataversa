import 'dart:developer';

import 'package:dataversa/src/controllers/auth_controller.dart';
import 'package:dataversa/src/database/database.dart';
import 'package:dataversa/src/models/session_key_model.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:isar/isar.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _database = GetIt.I<Database>();
  final _authController = GetIt.I<AuthController>();

  Future<void> _initialize() async {
    await _database.initializeDatabase();
  }

  @override
  void initState() {
    super.initState();
    _initialize().then((_) {
      _database.isar.sessionKeys.where().count().then((value) {
        final notHaveSessionKey = value == 0;

        if (notHaveSessionKey) {
          context.go('/auth');
        } else {
          _authController.logged.set(true);
          context.go('/home');
        }
      });
      // final hasSessionKey = query == 0;

      // if (hasSessionKey) {
      //   context.go('/auth');
      // } else {
      //   context.go('/home');
      // }
      // Future.delayed(const Duration(seconds: 2), () async {
      //   final query = await _database.isar.sessionKeys.where().count();
      //   final hasSessionKey = query == 0;

      //   if (hasSessionKey) {
      //     context.go('/auth');
      //   } else {
      //     context.go('/home');
      //   }
      // });
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
