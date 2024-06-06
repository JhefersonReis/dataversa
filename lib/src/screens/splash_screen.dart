import 'package:dataversa/src/database/database.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _database = GetIt.I<Database>();

  Future<void> _initialize() async {
    await _database.initializeDatabase();
  }

  @override
  void initState() {
    super.initState();
    _initialize().then((_) {
      Future.delayed(const Duration(seconds: 2), () {
        context.go('/auth');
      });
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
