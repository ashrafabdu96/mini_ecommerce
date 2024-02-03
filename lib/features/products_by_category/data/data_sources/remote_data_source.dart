import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mini_ecommerce/core/constants/api_links.dart';
import 'package:mini_ecommerce/core/error/exceptions.dart';
import 'package:mini_ecommerce/features/products_by_category/data/models/product_bay_cat_model.dart';

abstract class ProductByCatRemoteDataSource {
  Future<ProductByCatModel> getDataByCat(int userId, int categoryId);
}

class ProductByCatRemoteDataSourceImpl extends ProductByCatRemoteDataSource {
  @override
  Future<ProductByCatModel> getDataByCat(int userId, int categoryId) async {
    final remoteData = await http.post(Uri.parse(ApiLinks.testLink), body: {
      "userID": userId.toString(),
      "categoryId": categoryId.toString()
    });
    if (remoteData.statusCode == 200) {
      final decodedJson = jsonDecode(remoteData.body);
      return ProductByCatModel.fromJson(decodedJson);
    } else {
      throw ServerException();
    }
  }
}
