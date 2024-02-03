import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:mini_ecommerce/core/constants/api_links.dart';
import 'package:mini_ecommerce/core/error/exceptions.dart';
import 'package:mini_ecommerce/features/cart/domain/entities/cart_entity.dart';
import 'package:mini_ecommerce/features/payment/data/models/address_model.dart';
import 'package:mini_ecommerce/features/payment/data/models/region_model.dart';
import 'package:mini_ecommerce/features/payment/domain/entities/address_entities/address_entity.dart';
import 'package:mini_ecommerce/features/payment/domain/entities/payment_entities/payment_entity.dart';

abstract class PaymentRemoteDataSource {
  Future<AddressModel> getAddress(int userId);
  Future<RegionModel> getRegion(int cityId);
  Future<Unit> addAddress({required AddressEntity addressEntity});
  Future<Unit> updateAddress({required AddressEntity addressEntity});
  Future<Unit> addPaymentOrder(
      {required int userId,
      required double total,
      // Map<String?, dynamic>? orderJson,
      required List<CartDataEntity> cartDataEntityList});
  Future<Unit> addPaymentInfo({required PaymentEntity paymentEntity});
}

class PaymentRemoteDataSourceImpl extends PaymentRemoteDataSource {
  @override
  Future<AddressModel> getAddress(int userId) async {
    final response = await http.post(Uri.parse(ApiLinks.kLinkUserAddressData),
        body: {"userId": userId.toString()});
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      print("from getUserAddress Remote=> $decodedResponse");

      // print(
      // "from getUserAddress Remote=> ${UserAddressModel.fromJson(decodedResponse)..neighborhood}");
      return AddressModel.fromJson(decodedResponse);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<RegionModel> getRegion(int cityId) async {
    final response = await http.post(Uri.parse(ApiLinks.kLinkRegionData),
        body: {"cityIdAddress": cityId.toString()});
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      print(
          "from getUserAddress Remote=> ${RegionModel.fromJson(decodedResponse).addressRegionDataEntityList!.map((element) {
        print(element.region);
      })}");
      return RegionModel.fromJson(decodedResponse);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addAddress({required AddressEntity addressEntity}) async {
    final response = await http.post(
      Uri.parse(ApiLinks.kLinkAddUserAddress),
      body: {
        "userId": addressEntity.userId,
        "firstName": addressEntity.firstName,
        "secondName": addressEntity.secondName,
        "lastName": addressEntity.lastName,
        "addressId": addressEntity.addressId,
        "neighborhood": addressEntity.neighborhood,
        "nearestPlace": addressEntity.nearestPlace,
        "streetName": addressEntity.streetName,
        "phoneNumber": addressEntity.phoneNumber
      },
    );
    final decodedJson = jsonDecode(response.body);
    print(decodedJson);
    if (response.statusCode == 200) {
      return unit;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> updateAddress({required AddressEntity addressEntity}) async {
    final response = await http.post(
      Uri.parse(ApiLinks.kLinkUpdateUserAddress),
      body: {
        "userId": addressEntity.userId,
        "firstName": addressEntity.firstName,
        "secondName": addressEntity.secondName,
        "lastName": addressEntity.lastName,
        "addressId": addressEntity.addressId,
        "neighborhood": addressEntity.neighborhood,
        "nearestPlace": addressEntity.nearestPlace,
        "streetName": addressEntity.streetName,
        "phoneNumber": addressEntity.phoneNumber
      },
    );
    final decodedJson = jsonDecode(response.body);
    print(decodedJson);
    if (response.statusCode == 200) {
      return unit;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addPaymentInfo({required PaymentEntity paymentEntity}) async {
    final response = await http.post(
      Uri.parse(ApiLinks.kLinkPaymentInfo),
      body: {
        "userId": paymentEntity.userIdPay,
        "senderName": paymentEntity.senderName,
        "paymentTypeId": paymentEntity.payTypeId,
        "accountNumber": paymentEntity.accountNumber,
        "amount": paymentEntity.amount,
        "phoneNumber": paymentEntity.phoneNumber,
        "remittanceNumber": paymentEntity.remittanceNumber
      },
    );
    final decodedJson = jsonDecode(response.body);
    if (kDebugMode) {
      print(decodedJson);
    }
    if (response.statusCode == 200) {
      return unit;
    } else {
      throw ServerException();
    }
  }

  @override
  Future<Unit> addPaymentOrder(
      {required int userId,
      required double total,
      // Map<String?, dynamic>? orderJson,
      required List<CartDataEntity> cartDataEntityList}) async {
    Map<String, dynamic> orderData = {
      // in the body of the http request {"orderDetail":cartDataEntityList.map((e) => e.toJson()).toList()}
      // i will send cartDataEntityList.map((e) => e.toJson()).toList()
      "data": cartDataEntityList.map((item) {
        Map<String, dynamic> orderData = {
          "item_id_order": item.itemsId.toString(),
          "order_id": '1',
          "quantity": item.cartQuantity.toString(),
          "discount": item.itemsDiscount.toString(),
          "unti_price": item.itemsPrice.toString(),
          "total_price": ((item.itemsPrice!.toInt() -
                      (item.itemsPrice!.toInt() *
                          item.itemsDiscount!.toInt() /
                          100)) *
                  item.cartQuantity!.toInt())
              .toString()
        };
        return orderData;
      }).toList(),
    };
    print(orderData);
    final response = await http.post(
      Uri.parse(ApiLinks.kLinkPaymentOrder),
      body: {
        "userId": userId.toString(),
        "orderDetails": jsonEncode(orderData).toString(),
        // "orderDetails": jsonEncode(orderJson).toString(),
        "total": total.toString()
      },
    );
    final decodedJson = jsonDecode(response.body);
    if (kDebugMode) {
      // print(decodedJson);
    }
    if (response.statusCode == 200) {
      return unit;
    } else {
      throw ServerException();
    }
  }
}
