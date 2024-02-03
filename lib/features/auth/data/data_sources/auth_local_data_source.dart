import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/features/auth/data/models/auth_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class AuthLocalDataSource {
  // Future<List<AuthModel>> getCachedPosts();
  Future<Unit> cacheUser(AuthModel authModel);
}

class AuthLocalDataSourceImp implements AuthLocalDataSource {
  final SharedPreferences sharedPreferences;
  AuthLocalDataSourceImp({required this.sharedPreferences});

  @override
  Future<Unit> cacheUser(dynamic authModel) {
    Map<String, dynamic> authModelToJson = authModel.toJson();
    sharedPreferences.setString(
      "CACHED_USER",
      json.encode(
        authModelToJson,
      ),
    );
    return Future.value(unit);
  }

  // @override
  // Future<List<PostModel>> getCachedPosts() {
  //   final String? jsonString = sharedPreferences.getString("CACHED_POSTS");
  //   if (jsonString != null) {
  //     final List decodeJsonString = json.decode(jsonString);
  //     final List<PostModel> jsonToPostModels = decodeJsonString
  //         .map<PostModel>(
  //             (postModel) => postModel.PostModel.fromJson(postModel))
  //         .toList();
  //     return Future.value(jsonToPostModels);
  //   } else {
  //     throw EmptyCacheException();
  //   }
  // }
}
