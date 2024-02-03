import 'package:equatable/equatable.dart';

class AddressEntity extends Equatable {
  String? userId;
  String? status;
  String? firstName;
  String? secondName;
  String? addressId;
  String? lastName;
  String? neighborhood;
  String? streetName;
  String? nearestPlace;
  String? cityName;
  String? region;
  String? phoneNumber;
  int? cityNumber;
  List<CityEntity>? cities;
  AddressEntity({
    this.userId,
    this.status,
    this.firstName,
    this.secondName,
    this.lastName,
    this.streetName,
    this.region,
    this.nearestPlace,
    this.neighborhood,
    this.cityName,
    this.phoneNumber,
    this.addressId,
    this.cities,
    this.cityNumber,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [
        userId,
        status,
        firstName,
        secondName,
        lastName,
        streetName,
        region,
        nearestPlace,
        neighborhood,
        cityName,
        phoneNumber,
        addressId,
        cities,
        cityNumber,
      ];
}

class CityEntity {
  int? cityId;
  String? cityName;
  int? countryIdCity;
  CityEntity({this.cityId, this.cityName, this.countryIdCity});
}
