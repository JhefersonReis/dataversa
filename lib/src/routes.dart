import 'package:dataversa/src/screens/auth_screen.dart';
import 'package:dataversa/src/screens/form_screen.dart';
import 'package:dataversa/src/screens/home_screen.dart';
import 'package:dataversa/src/screens/responses_screen.dart';
import 'package:dataversa/src/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: '/auth',
      builder: (context, state) => const AuthScreen(),
    ),
    GoRoute(
      path: '/home',
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: '/responses',
      builder: (context, state) => const ResponsesScreen(),
    ),
    GoRoute(
      path: '/form/:surveyId/:responseId',
      pageBuilder: (context, state) {
        final responseId = int.parse(state.pathParameters['responseId']!);
        final surveyId = int.parse(state.pathParameters['surveyId']!);

        return MaterialPage(
          child: FormScreen(
            responseId: responseId,
            surveyId: surveyId,
          ),
        );
      },
      // builder: (context, state) => const FormScreen(
      //   responseId: 1,
      //   surveyId: 1111111,
      // ),
    ),
  ],
);
