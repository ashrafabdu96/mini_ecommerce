import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mini_ecommerce/core/constants/api_links.dart';
import 'package:mini_ecommerce/core/error/exceptions.dart';
import 'package:mini_ecommerce/features/auth/data/models/auth_model.dart';

abstract class AuthRemoteDataSource {
  Future<AuthModel> login(String userEmail, String userPassword);
  Future<AuthModel> signup(String userEmail, String userPassword,
      String userName, String phoneNumber);
  Future<AuthModel> verifyCode(String email, String verifyCode);
  Future<AuthModel> verifyCodeForgetPassword(String email, String verifyCode);
  Future<AuthModel> forgetPasswordCheckEmail(String userEmail);
}

class AuthRemoteDataSourceImp implements AuthRemoteDataSource {
  @override
  Future<AuthModel> login(String userEmail, String userPassword) async {
    final response = await http.post(Uri.parse(ApiLinks.kLinkLogin),
        body: {"email": userEmail, "password": userPassword});
    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      return AuthModel.fromJson(responseBody);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<AuthModel> signup(String userEmail, String userPassword,
      String userName, String phoneNumber) async {
    final response = await http.post(Uri.parse(ApiLinks.kLinkSignUp), body: {
      "username": userName,
      "email": userEmail,
      "phone": phoneNumber,
      "password": userPassword
    });
    print(response.statusCode.toString());
    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      return AuthModel.fromJson(responseBody);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<AuthModel> verifyCode(String email, String verifyCode) async {
    final response = await http.post(Uri.parse(ApiLinks.kLinkVerifyCodeSign),
        body: {"email": email, "verifycode": verifyCode});
    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = json.decode(response.body);
      print("remote data==>> $responseBody");
      return AuthModel.fromJson(responseBody);
    } else {
      throw ServerException();
    }
  }

  ///Forget Password
  @override
  Future<AuthModel> forgetPasswordCheckEmail(String userEmail) async {
    final response = await http
        .post(Uri.parse(ApiLinks.kLinkCheckEmail), body: {"email": userEmail});
    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      print("remote data==>> $responseBody");
      return AuthModel.fromJson(responseBody);
    } else {
      throw ServerException();
    }
  }

  Future<AuthModel> resetPassword(String email, String password) async {
    final response = await http.post(Uri.parse(ApiLinks.kLinkResetPassword),
        body: {"email": email, "password": password});
    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      print("remote data==>> $responseBody");
      return AuthModel.fromJson(responseBody);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<AuthModel> verifyCodeForgetPassword(
      String email, String verifyCode) async {
    final response = await http.post(Uri.parse(ApiLinks.kLinkVerifyCodeForget),
        body: {"email": email, "verifycode": verifyCode});
    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = json.decode(response.body);
      print("remote data==>> $responseBody");
      return AuthModel.fromJson(responseBody);
    } else {
      throw ServerException();
    }
  }

  Future<AuthModel> changePassword(
      {required String email,
      required String oldPassword,
      required String newPassword}) async {
    final response = await http.post(Uri.parse(ApiLinks.kLinkChangePassword),
        body: {
          "email": email,
          "oldPassword": oldPassword,
          "newPassword": newPassword
        });
    if (response.statusCode == 200) {
      Map<String, dynamic> responseBody = jsonDecode(response.body);
      print("remote data==>> $responseBody");
      return AuthModel.fromJson(responseBody);
    } else {
      throw ServerException();
    }
  }
}
