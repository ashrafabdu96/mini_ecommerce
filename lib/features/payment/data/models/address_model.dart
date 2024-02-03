import 'package:mini_ecommerce/features/payment/domain/entities/address_entities/address_entity.dart';

class AddressModel extends AddressEntity {
  AddressModel({
    super.userId,
    super.status,
    super.cityName,
    super.neighborhood,
    super.nearestPlace,
    super.region,
    super.streetName,
    super.firstName,
    super.secondName,
    super.lastName,
    super.phoneNumber,
    super.addressId,
    super.cities,
    super.cityNumber,
  });

  AddressModel.fromJson(Map<String, dynamic> json) {
    userId = json['data'] == false ? null : json['data']['user_id'].toString();
    status = json['status'];
    addressId =
        json['data'] == false ? null : json['data']['address_id'].toString();
    firstName = json['data'] == false ? null : json['data']['first_name'];
    secondName = json['data'] == false ? null : json['data']['second_name'];
    lastName = json['data'] == false ? null : json['data']['third_name'];
    neighborhood = json['data'] == false ? null : json['data']['Neighborhood'];
    streetName = json['data'] == false ? null : json['data']['street_name'];
    nearestPlace = json['data'] == false ? null : json['data']['nearest_place'];
    cityName = json['data'] == false ? null : json['data']['city_name'];
    region = json['data'] == false ? null : json['data']['region'];
    phoneNumber = json['data'] == false ? null : json['data']['phone_number'];
    cityNumber = json['data'] == false ? null : json['data']['cityNumber'];
    if (json['cities'] != null) {
      cities = <CityModel>[];
      json['cities'].forEach((v) {
        cities!.add(CityModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['user_id'] = userId;
    data['address_id'] = addressId;
    data['first_name'] = firstName;
    data['second_name'] = secondName;
    data['third_name'] = lastName;
    data['Neighborhood'] = neighborhood;
    data['street_name'] = streetName;
    data['nearest_place'] = nearestPlace;
    data['city_name'] = cityName;
    data['region'] = region;
    data['phone_number'] = phoneNumber;
    return data;
  }
}

class CityModel extends CityEntity {
  CityModel({super.cityId, super.cityName, super.countryIdCity});

  CityModel.fromJson(Map<String, dynamic> json) {
    cityId = json['city_id'];
    cityName = json['city_name'];
    countryIdCity = json['country_id_city'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city_id'] = cityId;
    data['city_name'] = cityName;
    data['country_id_city'] = countryIdCity;
    return data;
  }
}
