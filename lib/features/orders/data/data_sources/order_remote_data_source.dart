import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:mini_ecommerce/core/constants/api_links.dart';
import 'package:mini_ecommerce/core/error/exceptions.dart';
import 'package:mini_ecommerce/features/orders/data/models/head_order_model.dart';
import 'package:mini_ecommerce/features/orders/data/models/order_details_model.dart';

abstract class OrderRemoteDataSource {
  Future<HeadOrderModel> getOrders({required String where});
  Future<OrderDetailsModel> getOrderDetails({required int orderId});
}

class OrderRemoteDataSourceImpl extends OrderRemoteDataSource {
  @override
  Future<HeadOrderModel> getOrders({required String where}) async {
    final response = await http
        .post(Uri.parse(ApiLinks.kLinkGetOrder), body: {'where': where});
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      print("from getUserAddress Remote=> $decodedResponse");
      return HeadOrderModel.fromJson(decodedResponse);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<OrderDetailsModel> getOrderDetails({required int orderId}) async {
    final response = await http.post(Uri.parse(ApiLinks.kLinkGetOrderDetails),
        body: {'orderId': orderId.toString()});
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      print("from getUserAddress Remote=> $decodedResponse");
      return OrderDetailsModel.fromJson(decodedResponse);
    } else {
      throw ServerException();
    }
  }
}
