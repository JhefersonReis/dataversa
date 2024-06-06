import 'package:dataversa/src/dataversa_app.dart';
import 'package:dataversa/src/injector.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setup();

  runApp(const MyApp());
}
