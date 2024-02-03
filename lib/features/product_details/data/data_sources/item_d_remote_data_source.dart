import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:mini_ecommerce/core/constants/api_links.dart';
import 'package:mini_ecommerce/core/error/exceptions.dart';
import 'package:mini_ecommerce/features/product_details/data/models/item_detail_model.dart';
import 'package:mini_ecommerce/features/product_details/data/models/item_operation_model.dart';
import 'package:mini_ecommerce/features/product_details/data/models/item_variation_model.dart';
import 'package:mini_ecommerce/features/product_details/data/models/reviews_model.dart';
import 'package:mini_ecommerce/injection_container.dart';

abstract class ItemDetailRemoteDataSource {
  Future<ItemDetailModel> getItemDetailData(int itemId);
  Future<ItemDetailOperationModel> addToCart(String userId, String itemId);
  Future<ItemDetailOperationModel> deleteFromCart(String userId, String itemId);
  Future<ItemDetailOperationModel> addToFavorite(int userId, int itemId);
  Future<ItemDetailOperationModel> deleteFromFavorite(int userId, int itemId);
  Future<ItemVariationModel> getItemVariation(int itemId);
  Future<Unit> checkBeforeRate({required int itemId, required int userId});
  Future<Map<String, dynamic>> addOrUpdateReview(
      {required int itemId, required int userId, String? content, int? stars});
}

class ItemDetailRemoteDataSourceImpl extends ItemDetailRemoteDataSource {
  @override
  Future<ItemDetailModel> getItemDetailData(int itemId) async {
    final response = await http.post(
      Uri.parse(ApiLinks.kLinkItemsDetails),
      body: {
        "items_id": itemId.toString(),
        "userId": getUserId().toString(),
      },
    );

    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      print("remotDataB===> $decodedJson");

      final ItemDetailModel jsonData = ItemDetailModel.fromJson(decodedJson);
      // print("remoteData===> ${jsonData}");

      return jsonData;
    } else {
      print("fail");
      throw ServerException();
    }
  }

  @override
  Future<ItemDetailOperationModel> addToCart(
      String userId, String itemId) async {
    final response = await http.post(
        Uri.parse(
          ApiLinks.kLinkAddToCart,
        ),
        body: {"userId": userId, "itemId": itemId});
    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      print("remotDataB===> $decodedJson");

      final jsonData = ItemDetailOperationModel.fromJson(decodedJson);
      print("remoteData===> ${jsonData}");
      return jsonData;
    } else {
      print("fail");
      throw ServerException();
    }
  }

  @override
  Future<ItemDetailOperationModel> deleteFromCart(
      String userId, String itemId) async {
    final response = await http.post(
        Uri.parse(
          ApiLinks.kLinkDeleteFromCart,
        ),
        body: {"userId": userId, "itemId": itemId});
    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      print("remotDataDelete===> $decodedJson");

      final jsonData = ItemDetailOperationModel.fromJson(decodedJson);
      print("remoteDataDelete===> ${jsonData}");
      return jsonData;
    } else {
      print(" Delete fail");
      throw ServerException();
    }
  }

  @override
  Future<ItemDetailOperationModel> addToFavorite(int userId, int itemId) async {
    final response = await http.post(
        Uri.parse(
          ApiLinks.kLinkAddToFav,
        ),
        body: {"userId": userId.toString(), "itemId": itemId.toString()});
    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      print("remotDataB===> $decodedJson");

      final jsonData = ItemDetailOperationModel.fromJson(decodedJson);
      print("remoteData===> ${jsonData}");
      return jsonData;
    } else {
      print("fail");
      throw ServerException();
    }
  }

  @override
  Future<ItemDetailOperationModel> deleteFromFavorite(
      int userId, int itemId) async {
    final response = await http.post(
        Uri.parse(
          ApiLinks.kLinkDeleteFromFav,
        ),
        body: {"userId": userId.toString(), "itemId": itemId.toString()});
    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      print("remotDataDelete===> $decodedJson");

      final jsonData = ItemDetailOperationModel.fromJson(decodedJson);
      print("remoteDataDelete===> ${jsonData}");
      return jsonData;
    } else {
      print(" Delete fail");
      throw ServerException();
    }
  }

  @override
  Future<ItemVariationModel> getItemVariation(int itemId) async {
    final response = await http.post(
      Uri.parse(ApiLinks.kLinkItemsDetailsProperty),
      body: {"items_id": itemId.toString()},
    );
    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      // print("remotVariation===> $decodedJson");

      final jsonData = ItemVariationModel.fromJson(decodedJson);
      // print("remoteVariation===> ${jsonData.itemVariationsData![0].imageName}");

      return jsonData;
    } else {
      print("fail");
      throw ServerException();
    }
  }

  Future<ReviewsModel> getItemReviews({required int itemId}) async {
    final response = await http.post(
      Uri.parse(ApiLinks.kLinkItemsReviews),
      body: {"itemId": itemId.toString()},
    );
    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      print("remoteReviews===> $decodedJson");

      final jsonData = ReviewsModel.fromJson(decodedJson);
      // print("remoteVariation===> ${jsonData.itemVariationsData![0].imageName}");
      return jsonData;
    } else {
      print("fail");
      throw ServerException();
    }
  }

  @override
  Future<Unit> checkBeforeRate(
      {required int itemId, required int userId}) async {
    final response = await http.post(
      Uri.parse(ApiLinks.kLinkItemsDetailsCheckBeforeRate),
      body: {
        "itemId": itemId.toString(),
        "userId": userId.toString(),
      },
    );
    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      // print(decodedJson);
      if (decodedJson['status'] == 'Bought') {
        return unit;
      } else {
        throw NotFoundException();
      }
    } else {
      print("fail");
      throw ServerException();
    }
  }

  @override
  Future<Map<String, dynamic>> addOrUpdateReview(
      {required int itemId,
      required int userId,
      String? content,
      int? stars}) async {
    final response = await http.post(
      Uri.parse(ApiLinks.kLinkItemsDetailsCheckBeforeRate),
      body: {
        "itemId": itemId.toString(),
        "userId": userId.toString(),
        "content": content ?? "",
        "stars": stars == null ? 0.toString() : stars.toString()
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> decodedJson = json.decode(response.body);
      print("from add or update $decodedJson");
      if (decodedJson['status'] == 'Bought') {
        return decodedJson;
      } else {
        throw NotFoundException();
      }
    } else {
      print("fail");
      throw ServerException();
    }
  }
}
