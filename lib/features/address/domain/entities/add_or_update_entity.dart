class AddOrUpdateEntity {
  String? userId;
  String? firstName;
  String? secondName;
  String? thirdName;
  String? addressId;
  String? neighborhood;
  String? nearestPlace;
  String? streetName;
  String? phoneNumber;

  AddOrUpdateEntity(
      {this.userId,
      this.firstName,
      this.secondName,
      this.thirdName,
      this.addressId,
      this.neighborhood,
      this.nearestPlace,
      this.streetName,
      this.phoneNumber});

  AddOrUpdateEntity.fromJson(Map<String, dynamic> json) {
    userId = json['user_id'];
    firstName = json['first_name'];
    secondName = json['second_name'];
    thirdName = json['third_name'];
    addressId = json['address_id'];
    neighborhood = json['Neighborhood'];
    nearestPlace = json['nearest_place'];
    streetName = json['street_name'];
    phoneNumber = json['phone_number'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['user_id'] = userId;
    data['first_name'] = firstName;
    data['second_name'] = secondName;
    data['third_name'] = thirdName;
    data['address_id'] = addressId;
    data['Neighborhood'] = neighborhood;
    data['nearest_place'] = nearestPlace;
    data['street_name'] = streetName;
    data['phone_number'] = phoneNumber;
    return data;
  }
}
