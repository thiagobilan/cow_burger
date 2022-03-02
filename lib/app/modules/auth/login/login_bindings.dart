import 'package:cow_burger/app/models/repository/auth_repository.dart';
import 'package:cow_burger/app/models/repository/auth_repository_impl.dart';
import 'package:cow_burger/app/modules/auth/login/login_controller.dart';
import 'package:get/get.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AuthRepository>(
      () => AuthRepositoryImpl(
        restClient: Get.find(),
      ),
    );
    Get.lazyPut(
      () => LoginController(
        authRepository: Get.find(),
      ),
    );
  }
}
