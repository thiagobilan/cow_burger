import 'dart:developer';

import 'package:cow_burger/app/core/exception/user_notfount_exception.dart';
import 'package:cow_burger/app/core/rest_client/rest_client.dart';
import 'package:cow_burger/app/models/user_model.dart';

import './auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final RestClient _restClient;
  AuthRepositoryImpl({
    required RestClient restClient,
  }) : _restClient = restClient;
  @override
  Future<UserModel> registrer(
      String name, String email, String password) async {
    final result = await _restClient.post(
        'auth/register/', {'nome': name, 'email': email, 'senha': password});
    if (result.hasError) {
      var message = 'Erro ao registrar usuário!';
      if (result.statusCode == 40) {
        message = result.body['error'];
      }
      log(message, error: result.statusText, stackTrace: StackTrace.current);
      throw RestClientException(message);
    }
    return login(email, password);
  }

  @override
  Future<UserModel> login(String email, String password) async {
    final result = await _restClient.post(
      'auth/',
      {
        'email': email,
        'senha': password,
      },
    );
    if (result.hasError) {
      if (result.statusCode == 403) {
        log('Usuario ou Senha inválidos',
            error: result.statusText, stackTrace: StackTrace.current);
        throw UserNotfountException();
      }
      log('Erro ao autenticar o usuario (${result.statusCode})',
          error: result.statusText, stackTrace: StackTrace.current);

      throw RestClientException('Erro ao autenticar usuário');
    }
    return UserModel.fromMap(result.body);
  }
}
