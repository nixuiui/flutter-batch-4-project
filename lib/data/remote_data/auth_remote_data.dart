import 'package:flutter_batch_4_project/data/remote_data/network_service/network_service.dart';
import 'package:flutter_batch_4_project/models/auth_response_model.dart';
import 'package:flutter_batch_4_project/models/user_model.dart';

abstract class AuthRemoteData {
  Future<AuthResponseModel> postLogin(String email, String password);
  Future<User> getProfile();
}

class AuthRemoteDataImpl implements AuthRemoteData {

  late final NetworkService networkService;

  AuthRemoteDataImpl(
    this.networkService
  );

  @override
  Future<User> getProfile() async {
    final response = await networkService.get(
      url: "/api/profile/me"
    );
    return User.fromJson(response.data['data']);
  }

  @override
  Future<AuthResponseModel> postLogin(String email, String password) async {
    final response = await networkService.post(
      url: "/api/auth/login",
      data: {
        "email": "admin@gmail.com",
        "password": "123456"
      }
    );

    return AuthResponseModel.fromJson(response.data['data']);
  }

}