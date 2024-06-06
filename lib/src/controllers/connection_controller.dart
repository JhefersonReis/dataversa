import 'dart:async';

import 'package:dio/dio.dart';

class ConnectionController {
  ConnectionController();

  static bool _isConnected = false;

  bool get isConnected => _isConnected;

  final _client = Dio();

  Future<void> checkConnection() async {
    try {
      final response = await _client.get('https://example.com');

      _isConnected = response.statusCode == 200;
    } catch (_) {
      _isConnected = false;
    }
  }
}
