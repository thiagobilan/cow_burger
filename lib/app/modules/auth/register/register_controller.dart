import 'dart:developer';

import 'package:cow_burger/app/core/mixins/loader_mixins.dart';
import 'package:cow_burger/app/core/mixins/messages_mixin.dart';
import 'package:cow_burger/app/core/rest_client/rest_client.dart';
import 'package:cow_burger/app/models/repository/auth_repository.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController
    with LoaderMixins, MessagesMixin {
  final AuthRepository _authRepository;
  final _loading = false.obs;
  final _message = Rxn<MessageModel>();
  RegisterController({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  void onInit() {
    super.onInit();
    loaderListener(_loading);
    messageListener(_message);
  }

  Future<void> register(
      {required String name,
      required String email,
      required String password}) async {
    try {
      _loading.toggle();
      final userModel = await _authRepository.registrer(name, email, password);
      _loading.toggle();
      Get.back();
      _message(MessageModel(
          title: 'Sucesso',
          message: 'Cadastro Realizado com sucesso',
          type: MessageType.info));
    } on RestClientException catch (e, s) {
      _loading.toggle();
      log('Erro ao Registrar usuario', error: e, stackTrace: s);
      _message(
        MessageModel(
          title: 'Erro',
          message: e.message,
          type: MessageType.error,
        ),
      );
    } catch (e, s) {
      _loading.toggle();
      log('Erro ao Registrar usuario', error: e, stackTrace: s);
      _message(
        MessageModel(
          title: 'Erro',
          message: 'Erro ao Registrar usuario',
          type: MessageType.error,
        ),
      );
    }
  }
}
