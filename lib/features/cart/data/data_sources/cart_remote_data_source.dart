import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mini_ecommerce/core/constants/api_links.dart';
import 'package:mini_ecommerce/core/error/exceptions.dart';
import 'package:mini_ecommerce/features/cart/data/models/cart_model.dart';
import 'package:mini_ecommerce/features/cart/data/models/cart_operation_model.dart';
import 'package:mini_ecommerce/features/cart/domain/entities/cart_entity.dart';
import 'package:mini_ecommerce/features/cart/domain/entities/cart_operation_entity.dart';

abstract class CartRemoteDataSource {
  Future<CartEntity> getCartData(int userId);
  @override
  Future<CartOperationEntity> deleteFromCart(String userId, String itemId);
  Future<CartOperationEntity> updateCartItemQuantity(
      {required int itemId, required int quantity});
}

class CartRemoteDataSourceImpl extends CartRemoteDataSource {
  @override
  Future<CartOperationModel> updateCartItemQuantity(
      {required int itemId, required int quantity}) async {
    final response = await http.post(
        Uri.parse(
          ApiLinks.kLinkUpdateCartQuantity,
        ),
        body: {
          'cartQuantity': quantity.toString(),
          'itemId': itemId.toString(),
        });
    if (response.statusCode == 200) {
      final decodedJson = jsonDecode(response.body);
      return CartOperationModel.fromJson(decodedJson);
    } else {
      print(" Delete fail");
      throw ServerException();
    }
  }

  @override
  Future<CartModel> getCartData(int userId) async {
    final response = await http.post(Uri.parse(ApiLinks.kLinkCartData),
        body: {"userId": userId.toString()});
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      // print("from Cart Remote=> ${CartModel.fromJson(decodedResponse)}");
      return CartModel.fromJson(decodedResponse);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<CartOperationModel> deleteFromCart(
      String userId, String itemId) async {
    final response = await http.post(
        Uri.parse(
          ApiLinks.kLinkDeleteFromCart,
        ),
        body: {"userId": userId, "itemId": itemId});
    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      // print("FROM CART DELETE==>> ${CartOperationModel.fromJson(decodedJson)}");

      return CartOperationModel.fromJson(decodedJson);
    } else {
      print(" Delete fail");
      throw ServerException();
    }
  }
}
