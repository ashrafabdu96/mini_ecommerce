class RegionEntity {
  String? status;
  List<RegionDataEntity>? addressRegionDataEntityList;

  RegionEntity({this.status, this.addressRegionDataEntityList});
}

class RegionDataEntity {
  int? addressId; //IN THE USER_ADDRESS IN THE DATABASE
  String? region;
  int? cityIdAddress;
  RegionDataEntity({this.addressId, this.region, this.cityIdAddress});
}
