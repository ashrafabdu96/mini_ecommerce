class RegionEntity {
  String? status;
  List<sRegionDataEntity>? addressRegionDataEntityList;

  RegionEntity({this.status, this.addressRegionDataEntityList});
}

class sRegionDataEntity {
  int? addressId;
  String? region;
  int? cityIdAddress;

  sRegionDataEntity({this.addressId, this.region, this.cityIdAddress});
}
