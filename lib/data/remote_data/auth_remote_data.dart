import 'package:flutter_batch_4_project/models/auth_response_model.dart';
import 'package:flutter_batch_4_project/models/user_model.dart';

abstract class AuthRemoteData {
  Future<AuthResponseModel> postLogin(String email, String password);
  Future<User> getProfile();
}