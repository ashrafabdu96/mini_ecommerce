import 'package:mini_ecommerce/features/product_details/domain/entities/item_variation_entity.dart';

class ItemVariationModel extends ItemVariationEntity {
  ItemVariationModel({required super.status, super.itemVariationsData});

  ItemVariationModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      itemVariationsData = <ItemVariationDataModel>[];
      json['data'].forEach((v) {
        itemVariationsData!.add(ItemVariationDataModel.fromJson(v));
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['status'] = status;
  //   if (itemVariationsData != null) {
  //     data['data'] = this.itemVariationsData!.map<ItemVariationDataModel>((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }

}

class ItemVariationDataModel extends ItemVariationData {
  ItemVariationDataModel({
    super.colorValue,
    super.imageName,
    super.sizeValue,
  });
  ItemVariationDataModel.fromJson(Map<String, dynamic> json) {
    colorValue = json["color_value"];
    imageName = json["image_name"];
    sizeValue = json["size_value"];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['color_value'] = colorValue;
    data['image_name'] = imageName;
    data['size_value'] = sizeValue;

    return data;
  }
}
