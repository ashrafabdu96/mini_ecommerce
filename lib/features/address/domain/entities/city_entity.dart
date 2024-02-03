class CityEntity {
  String? status;
  List<CityEntityData>? cityEntityDataList;
  CityEntity({this.status, this.cityEntityDataList});
}

class CityEntityData {
  int? cityId;
  String? cityName;
  int? countryIdCity;
  CityEntityData({this.cityId, this.cityName, this.countryIdCity});
}
