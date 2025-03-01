import 'package:dio/dio.dart';
import 'package:flutter_batch_4_project/data/remote_data/auth_remote_data.dart';
import 'package:flutter_batch_4_project/data/remote_data/network_service/network_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_remote_data_test.mocks.dart';

@GenerateMocks([
  NetworkService
])
void main() {
  
  late MockNetworkService mockNetworkService;
  late AuthRemoteDataImpl authRemoteData;

  setUp(() {
    mockNetworkService = MockNetworkService();
    authRemoteData = AuthRemoteDataImpl(mockNetworkService);
  });

  group("AuthRemoteData", () {

    test("Return User Data when login success", () async {
      final email = "admin@gmail.com";
      final password = "123456";
      final path = "/api/auth/login";

      final mockResponseData = {
        "data": {
          "user": {
            "name": "Admin",
            "email": "admin@gmail.com",
          },
          "access_token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL25naW5mb2luLm15LmlkL3B1YmxpYy9hcGkvYXV0aC9sb2dpbiIsImlhdCI6MTczMzA1MjQ4NiwiZXhwIjoxNzMzMDU2MDg2LCJuYmYiOjE3MzMwNTI0ODYsImp0aSI6Inh0SG5CSDlSb0paNjJtSUgiLCJzdWIiOiIxIiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.lsKDP492-9lM4XEX5SxlMnVHdorTOK3aH4-qiixMuYY",
        }
      };

      final mockResponse = Response(
        requestOptions: RequestOptions(path: path),
        statusCode: 200,
        data: mockResponseData
      );

      when(mockNetworkService.post(
        url: path,
        data: anyNamed("data")
      )).thenAnswer((_) async => mockResponse);

      final result = await authRemoteData.postLogin(email, password);

      expect(result.accessToken, "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwczovL25naW5mb2luLm15LmlkL3B1YmxpYy9hcGkvYXV0aC9sb2dpbiIsImlhdCI6MTczMzA1MjQ4NiwiZXhwIjoxNzMzMDU2MDg2LCJuYmYiOjE3MzMwNTI0ODYsImp0aSI6Inh0SG5CSDlSb0paNjJtSUgiLCJzdWIiOiIxIiwicHJ2IjoiMjNiZDVjODk0OWY2MDBhZGIzOWU3MDFjNDAwODcyZGI3YTU5NzZmNyJ9.lsKDP492-9lM4XEX5SxlMnVHdorTOK3aH4-qiixMuYY");
      expect(result.user?.name, "Admin");
      expect(result.user?.email, "admin@gmail.com");
      verify(mockNetworkService.post(
        url: path,
        data: {
          "email": email,
          "password": password
        }
      )).called(1);

    });

    test("Trhow Exception when login failed", () {
      const email = "admin@gmail.com";
      const password = "123456";
      const path = "/api/auth/login";

      when(mockNetworkService.post(
        url: path,
        data: anyNamed("data")
      )).thenThrow(Exception("Login Failed"));

      expect(() => authRemoteData.postLogin(email, password), throwsException);
      verify(mockNetworkService.post(
        url: path,
        data: {
          "email": email,
          "password": password
        }
      )).called(1);

    });
  });

}