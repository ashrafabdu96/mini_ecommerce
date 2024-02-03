import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:mini_ecommerce/core/constants/api_links.dart';
import 'package:mini_ecommerce/core/error/exceptions.dart';
import 'package:mini_ecommerce/features/address/data/models/address_region_model.dart';
import 'package:mini_ecommerce/features/address/data/models/user_address_model.dart';
import 'package:mini_ecommerce/features/address/domain/entities/user_address_entity.dart';

import '../models/city_model.dart';

abstract class AddressRemoteDataSource {
  Future<UserAddressModel> getUserAddress(int userId);
  Future<CityModel> getCityInfo();
  Future<AddressRegionModel> getRegionInfo(int cityId);
  Future<Unit> updateUserAddress(
      {required UserAddressEntity userAddressEntity});
}

class AddressRemoteDataSourceImpl extends AddressRemoteDataSource {
  ///***get userAddress info
  @override
  Future<UserAddressModel> getUserAddress(int userId) async {
    final response = await http.post(Uri.parse(ApiLinks.kLinkUserAddressData),
        body: {"userId": userId.toString()});
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      print("from getUserAddress Remote=> ${decodedResponse}");

      // print(
      // "from getUserAddress Remote=> ${UserAddressModel.fromJson(decodedResponse)..neighborhood}");
      return UserAddressModel.fromJson(decodedResponse);
    } else {
      throw ServerException();
    }
  }

  ///***get City and Region info
  @override
  Future<CityModel> getCityInfo() async {
    final response = await http.get(Uri.parse(ApiLinks.kLinkCityData));
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);

      return CityModel.fromJson(decodedResponse);
    } else {
      throw ServerException();
    }
  }

  @override
  Future<AddressRegionModel> getRegionInfo(int cityId) async {
    final response = await http.post(Uri.parse(ApiLinks.kLinkRegionData),
        body: {"cityIdAddress": cityId.toString()});
    if (response.statusCode == 200) {
      final decodedResponse = jsonDecode(response.body);
      // print(
      //     "from getUserAddress Remote=> ${AddressRegionModel.fromJson(decodedResponse).addressRegionDataEntityList!.map((element) {
      //   print(element.region);
      // })}");
      return AddressRegionModel.fromJson(decodedResponse);
    } else {
      throw ServerException();
    }
  }

  ///***Add userAddress info

  Future<Unit> addUserAddress(
      {required UserAddressEntity userAddressEntity}) async {
    final response = await http.post(
      Uri.parse(ApiLinks.kLinkAddUserAddress),
      body: {
        "userId": userAddressEntity.userId,
        "firstName": userAddressEntity.firstName,
        "secondName": userAddressEntity.secondName,
        "lastName": userAddressEntity.lastName,
        "addressId": userAddressEntity.addressId,
        "neighborhood": userAddressEntity.neighborhood,
        "nearestPlace": userAddressEntity.nearestPlace,
        "streetName": userAddressEntity.streetName,
        "phoneNumber": userAddressEntity.phoneNumber
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
  Future<Unit> updateUserAddress(
      {required UserAddressEntity userAddressEntity}) async {
    final response = await http.post(
      Uri.parse(ApiLinks.kLinkUpdateUserAddress),
      body: {
        "userId": userAddressEntity.userId,
        "firstName": userAddressEntity.firstName,
        "secondName": userAddressEntity.secondName,
        "lastName": userAddressEntity.lastName,
        "addressId": userAddressEntity.addressId,
        "neighborhood": userAddressEntity.neighborhood,
        "nearestPlace": userAddressEntity.nearestPlace,
        "streetName": userAddressEntity.streetName,
        "phoneNumber": userAddressEntity.phoneNumber
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
}
