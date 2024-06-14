import 'package:dataversa/src/routes.dart';
import 'package:dataversa/src/ui/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ToastificationWrapper(
      child: MaterialApp.router(
        title: 'DataVersa',
        // theme: ThemeData(
        //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //   useMaterial3: true,
        // ),
        theme: AppTheme.themeData,
        routerConfig: router,
      ),
    );
  }
}
