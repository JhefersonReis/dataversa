import 'dart:convert';
import 'dart:developer' as developer;

import 'package:dataversa/src/commom/rest_client.dart';
import 'package:dio/dio.dart';

class AuthRepository {
  final RestClient client;
  AuthRepository({required this.client});

  Future<String> login(String user, String password) async {
    try {
      final response = await client.post(
        '',
        data: {
          'method': 'get_session_key',
          'params': [
            user,
            password,
          ],
          'id': 1,
        },
      );

      final decode = jsonDecode(response.data as String);
      final sessionKey = decode['result'] as String;

      return sessionKey;
    } on DioException catch (e) {
      developer.log('Error during login: ${e.message}', error: e);
      rethrow;
    } catch (e) {
      developer.log('Unexpected error during login: ${e.toString()}');
      rethrow;
    }
  }
}
