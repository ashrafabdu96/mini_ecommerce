import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mini_ecommerce/core/constants/api_links.dart';
import 'package:mini_ecommerce/core/error/exceptions.dart';
import 'package:mini_ecommerce/features/favorite/data/models/favorite_model.dart';
import 'package:mini_ecommerce/features/favorite/data/models/favorite_operation_model.dart';
import 'package:mini_ecommerce/features/favorite/domain/entities/favorite_entity.dart';
import 'package:mini_ecommerce/features/favorite/domain/entities/favorite_operation_entity.dart';

abstract class RemoteFavoriteDataSource {
  Future<FavoriteEntity> getFavoriteData(int userId);
  Future<FavoriteOperationEntity> deleteFavorite(int userId, int itemId);
  Future<FavoriteOperationEntity> addToCartFromFavorite(int userId, int itemId);
}

class RemoteFavoriteDataSourceImpl extends RemoteFavoriteDataSource {
  @override
  Future<FavoriteOperationModel> deleteFavorite(int userId, int itemId) async {
    final response = await http.post(
        Uri.parse(
          ApiLinks.kLinkDeleteFromFav,
        ),
        body: {"userId": userId.toString(), "itemId": itemId.toString()});
    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      print(
          "FROM CART DELETE==>> ${FavoriteOperationModel.fromJson(decodedJson)}");

      return FavoriteOperationModel.fromJson(decodedJson);
    } else {
      print(" Delete fail");
      throw ServerException();
    }
  }

  @override
  Future<FavoriteModel> getFavoriteData(userId) async {
    final response = await http.post(Uri.parse(ApiLinks.kLinkFavoriteData),
        body: {"userId": userId.toString()});
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      // print(
      // "from Favorite Remote=> ${FavoriteModel.fromJson(decodedResponse).favoriteDataEntity!.length}");
      return FavoriteModel.fromJson(decodedResponse);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<FavoriteOperationModel> addToCartFromFavorite(
      int userId, int itemId) async {
    final response = await http.post(
        Uri.parse(
          ApiLinks.kLinkAddToCart,
        ),
        body: {"userId": userId.toString(), "itemId": itemId.toString()});
    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      print(
          "FROM add to CART from fav==>> ${FavoriteOperationModel.fromJson(decodedJson)}");

      return FavoriteOperationModel.fromJson(decodedJson);
    } else {
      print(" add fail");
      throw ServerException();
    }
  }
}
