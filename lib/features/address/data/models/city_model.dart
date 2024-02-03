import 'package:mini_ecommerce/features/address/domain/entities/city_entity.dart';

class CityModel extends CityEntity {
  CityModel({
    super.status,
    super.cityEntityDataList,
  });
  CityModel.fromJson(Map<String, dynamic> json) {
    status = json["status"];
    if (json["data"] != null) {
      cityEntityDataList = <CityDataModel>[];
      json["data"].forEach((v) {
        cityEntityDataList!.add(CityDataModel.fromJson(v));
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['status'] = status;
  //   if (cityDataModelList != null) {
  //     data['data'] = cityDataModelList!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class CityDataModel extends CityEntityData {
  CityDataModel({
    super.cityName,
    super.cityId,
    super.countryIdCity,
  });

  CityDataModel.fromJson(Map<String, dynamic> json) {
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
