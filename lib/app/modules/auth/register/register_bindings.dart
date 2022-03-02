import 'package:cow_burger/app/models/repository/auth_repository.dart';
import 'package:cow_burger/app/models/repository/auth_repository_impl.dart';
import 'package:cow_burger/app/modules/auth/register/register_controller.dart';
import 'package:get/get.dart';

class RegisterBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(
        restClient: Get.find(),
      ),
    );
    Get.lazyPut(
      () => RegisterController(
        authRepository: Get.find(),
      ),
    );
  }
}
