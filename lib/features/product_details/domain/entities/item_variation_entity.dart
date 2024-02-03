class ItemVariationEntity {
  String? status;
  List<ItemVariationData>? itemVariationsData;
  ItemVariationEntity({this.status, this.itemVariationsData});
}

class ItemVariationData {
  String? colorValue; //color
  String? imageName;
  String? sizeValue;

  ItemVariationData({this.colorValue, this.imageName, this.sizeValue});
}
