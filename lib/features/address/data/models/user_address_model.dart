import 'package:mini_ecommerce/features/address/domain/entities/user_address_entity.dart';

class UserAddressModel extends UserAddressEntity {
  UserAddressModel({
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
  });

  UserAddressModel.fromJson(Map<String, dynamic> json) {
    userId = json['data']['user_id'].toString();
    status = json['status'];
    addressId = json['data']['address_id'].toString();
    firstName = json['data']['first_name'];
    secondName = json['data']['second_name'];
    lastName = json['data']['third_name'];
    neighborhood = json['data']['Neighborhood'];
    streetName = json['data']['street_name'];
    nearestPlace = json['data']['nearest_place'];
    cityName = json['data']['city_name'];
    region = json['data']['region'];
    phoneNumber = json['data']['phone_number'];
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
