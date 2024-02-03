import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mini_ecommerce/core/constants/api_links.dart';
import 'package:mini_ecommerce/core/error/exceptions.dart';
import 'package:mini_ecommerce/features/search/data/models/search_item_model.dart';

abstract class SearchRemoteDataSource {
  Future<SearchItemModel> searchForProduct({required String query});
  Future<SearchItemModel> getSuggestion();
}

class SearchRemoteDataSourceImpl extends SearchRemoteDataSource {
  @override
  Future<SearchItemModel> searchForProduct({required String query}) async {
    final response = await http.post(Uri.parse(ApiLinks.kLinkProductsSearching),
        body: {'query': query});
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      print("from search Remote=> $decodedResponse");
      return SearchItemModel.fromJson(decodedResponse);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<SearchItemModel> getSuggestion() async {
    final response =
        await http.get(Uri.parse(ApiLinks.kLinkProductsSuggestion));
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      // print("from suggestion Remote=> $decodedResponse");
      return SearchItemModel.fromJson(decodedResponse);
    } else {
      throw ServerException();
    }
  }
}
