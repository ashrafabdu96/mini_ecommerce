import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mini_ecommerce/core/constants/api_links.dart';
import 'package:mini_ecommerce/core/error/exceptions.dart';
import 'package:mini_ecommerce/features/home/home/data/models/category_item_model.dart';
import 'package:mini_ecommerce/features/home/home/data/models/home_model.dart';

abstract class HomeRemoteDataSource {
  Future<HomeModel> getData(String userId);
  Future<CategoryItemsModel> getCategories();
}

class HomeRemoteDataSourceImpl extends HomeRemoteDataSource {
  @override
  Future<HomeModel> getData(String userId) async {
    final response = await http.post(Uri.parse(ApiLinks.kLinkHomeData),
        body: {"userID": userId.toString()});
    if (response.statusCode == 200) {
      final decodedJson = jsonDecode(response.body);
      final homeModels = HomeModel.fromJson(decodedJson);
      // for (var element in homeModels.items!) {
      //   print(element.itemsName);
      //   print(element.itemsDescription);
      // }
      // print("data source ${homeModels.items!}");

      return homeModels;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<CategoryItemsModel> getCategories() async {
    final response = await http.post(
      Uri.parse(ApiLinks.kLinkAllCategories),
    );
    if (response.statusCode == 200) {
      final decodedJson = json.decode(response.body);
      final categoryModel = CategoryItemsModel.fromJson(decodedJson);
      return categoryModel;
    } else {
      throw ServerException();
    }
  }
}
