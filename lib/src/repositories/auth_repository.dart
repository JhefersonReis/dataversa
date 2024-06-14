import 'dart:convert';
import 'dart:developer' as developer;

import 'package:dataversa/src/commom/rest_client.dart';

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
      final decode = jsonDecode(response.data);

      if (decode['result'] is Map && decode['result']['status'] != null) {
        String erro = decode['result']['status'];
        switch (erro) {
          case 'Invalid user name or password':
            erro = 'Usuário ou senha inválidos';
            break;
          default:
            erro = 'Ocorreu um erro ao tentar logar';
        }
        throw Exception(erro);
      } else {
        return decode['result'];
      }
    } catch (e) {
      developer.log('Unexpected error during login: ${e.toString()}');
      rethrow;
    }
  }
}
