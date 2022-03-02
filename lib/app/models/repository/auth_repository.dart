import 'package:cow_burger/app/models/user_model.dart';

abstract class AuthRepository {
  Future<UserModel> login(String email, String password);
  Future<UserModel> registrer(String name, String email, String password);
}
