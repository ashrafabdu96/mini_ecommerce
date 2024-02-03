import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/features/user_profile/data/models/user_model.dart';
import 'package:mini_ecommerce/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalProfileDataSource {
  Future<UserModel> getUserInformation();
}

class LocalProfileDataSourceImpl extends LocalProfileDataSource {
  @override
  Future<UserModel> getUserInformation() async {
    // sl.sl<SharedPreferences>()
    final userDecoded =
        jsonDecode(sl<SharedPreferences>().getString("CACHED_USER").toString());
    // print(userDecoded);
    final UserModel userInfo = UserModel.fromJson(userDecoded);
    return userInfo;
  }

  Future<Unit> cacheUser(dynamic authModel) {
    Map<String, dynamic> authModelToJson = authModel.toJson();
    sl<SharedPreferences>().setString(
      "CACHED_USER",
      json.encode(
        authModelToJson,
      ),
    );
    return Future.value(unit);
  }
}
