import 'package:mini_ecommerce/features/payment/domain/entities/address_entities/region_entity.dart';

class RegionModel extends RegionEntity {
  RegionModel({
    super.status,
    super.addressRegionDataEntityList,
  });

  RegionModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    if (json['data'] != null) {
      addressRegionDataEntityList = <RegionDataModel>[];
      json["data"].forEach((v) {
        addressRegionDataEntityList!.add(RegionDataModel.fromJson(v));
      });
    }
  }
}

class RegionDataModel extends RegionDataEntity {
  RegionDataModel({
    super.region,
    super.addressId,
    super.cityIdAddress,
  });
  RegionDataModel.fromJson(Map<String, dynamic> json) {
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
