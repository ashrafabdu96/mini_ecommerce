import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mini_ecommerce/core/constants/api_links.dart';
import 'package:mini_ecommerce/core/error/exceptions.dart';
import 'package:mini_ecommerce/features/user_profile/data/models/user_model.dart';
import 'package:mini_ecommerce/injection_container.dart';

abstract class RemoteProfileDataSource {
  Future<UserModel> getUserInfo({required int userId});
}

class RemoteProfileDataSourceImpl extends RemoteProfileDataSource {
  @override
  Future<UserModel> getUserInfo({required int userId}) async {
    final response = await http.get(
      Uri.parse("${ApiLinks.kLinkUserInfo}?userId=$userId"),
    );
    if (response.statusCode == 200) {
      final decodedJson = jsonDecode(response.body);
      print(decodedJson);
      UserModel userModel = UserModel.fromJson(decodedJson);
      return userModel;
    } else {
      throw ServerException();
    }
  }

  Future<Map<String, dynamic>> changeProfileImage(
      {required String imagePath}) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(ApiLinks.kLinkAddUserImage),
    );
    var imageFileRequest =
        await http.MultipartFile.fromPath('image', imagePath);
    request.files.add(imageFileRequest);
    Map<String, String> body = {
      "userId": getUserId(),
    };
    request.fields.addAll(body);
    var response = await request.send();
    if (response.statusCode == 200) {
      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      final finalResponse = jsonDecode(responseString);
      print(finalResponse);
      return finalResponse;
      // finalResponse["status"] == "success" ? setState(() {}) : null;
    } else {
      throw ServerException();
    }
  }
}
