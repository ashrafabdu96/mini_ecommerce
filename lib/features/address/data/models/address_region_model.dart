import 'package:mini_ecommerce/features/address/domain/entities/address_region_entity.dart';

class AddressRegionModel extends RegionEntity {
  AddressRegionModel({
    super.status,
    super.addressRegionDataEntityList,
  });

  AddressRegionModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    if (json['data'] != null) {
      addressRegionDataEntityList = <AddressRegionDataModel>[];
      json["data"].forEach((v) {
        addressRegionDataEntityList!.add(AddressRegionDataModel.fromJson(v));
      });
    }
  }
}

class AddressRegionDataModel extends sRegionDataEntity {
  AddressRegionDataModel({
    super.region,
    super.addressId,
    super.cityIdAddress,
  });
  AddressRegionDataModel.fromJson(Map<String, dynamic> json) {
    addressId = json['address_id'] as int;
    cityIdAddress = json['city_id_address'] as int;
    region = json['region'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['city_id_address'] = cityIdAddress;
    data['region'] = region;
    data['address_id'] = addressId;
    return data;
  }
}
