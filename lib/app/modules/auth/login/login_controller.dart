import 'dart:developer';

import 'package:cow_burger/app/core/constants/constants.dart';
import 'package:cow_burger/app/core/exception/user_notfount_exception.dart';
import 'package:cow_burger/app/core/mixins/loader_mixins.dart';
import 'package:cow_burger/app/core/mixins/messages_mixin.dart';
import 'package:cow_burger/app/models/repository/auth_repository.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController with LoaderMixins, MessagesMixin {
  final AuthRepository _authRepository;
  final _loading = false.obs;
  final _message = Rxn<MessageModel>();
  LoginController({
    required AuthRepository authRepository,
  }) : _authRepository = authRepository;

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
    messageListener(_message);
  }

  void login({required String email, required String password}) async {
    try {
      _loading.toggle();
      final userLogged = await _authRepository.login(email, password);
      final storage = GetStorage();
      storage.write(Constants.USER_KEY, userLogged.id);

      _loading.toggle();
    } on UserNotfountException catch (e, s) {
      _loading.toggle();
      log('Login ou senha invalidos', error: e, stackTrace: s);
      _message(
        MessageModel(
            title: 'Error',
            message: 'Login ou Senha Inválido',
            type: MessageType.error),
      );
    } catch (e, s) {
      _loading.toggle();
      log('Erro ao realizar login', error: e, stackTrace: s);
      _message(
        MessageModel(
            title: 'Error',
            message: 'Erro ao realizar login',
            type: MessageType.error),
      );
    }
  }
}
