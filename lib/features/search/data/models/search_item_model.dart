import 'package:mini_ecommerce/features/search/domain/entities/search_item_entity.dart';

class SearchItemModel extends SearchItemEntity {
  SearchItemModel({super.status, super.searchItemDataEntity});

  SearchItemModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      searchItemDataEntity = <SearchItemDataModel>[];
      json['data'].forEach((v) {
        searchItemDataEntity!.add(SearchItemDataModel.fromJson(v));
      });
    }
  }

  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = new Map<String, dynamic>();
  //   data['status'] = this.status;
  //   if (this.searchItemDataEntity != null) {
  //     data['searchItemDataModel'] =
  //         this.data!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class SearchItemDataModel extends SearchItemDataEntity {
  const SearchItemDataModel(
      {super.itemsId,
      super.itemsName,
      super.itemsNameAr,
      super.itemsDescription,
      super.itemsDescriptionAr,
      super.itemsImage,
      super.itemsPrice,
      super.itemsDiscount});

  factory SearchItemDataModel.fromJson(Map<String, dynamic> json) {
    return SearchItemDataModel(
      itemsId: json['items_id'],
      itemsName: json['items_name'],
      itemsNameAr: json['items_name_ar'],
      itemsDescription: json['items_description'],
      itemsDescriptionAr: json['items_description_ar'],
      itemsImage: json['items_image'],
      itemsPrice: json['items_price'],
      itemsDiscount: json['items_discount'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['items_id'] = itemsId;
    data['items_name'] = itemsName;
    data['items_name_ar'] = itemsNameAr;
    data['items_description'] = itemsDescription;
    data['items_description_ar'] = itemsDescriptionAr;
    data['items_image'] = itemsImage;
    data['items_price'] = itemsPrice;
    data['items_discount'] = itemsDiscount;
    return data;
  }
}
