// To parse this JSON data, do
//
//     final itemDetailModel = itemDetailModelFromJson(jsonString);

import 'package:mini_ecommerce/features/product_details/domain/entities/item_details_entity.dart';

class ItemDetailModel extends ItemDetailEntity {
  ItemDetailModel(
      {super.status,
      super.rateStars,
      super.publicRate,
      super.itemsId,
      super.itemsName,
      super.itemsNameAr,
      super.itemsDescription,
      super.itemsDescriptionAr,
      super.itemsImage,
      super.itemsImage2,
      super.itemsImage3,
      super.itemsImage4,
      super.itemsDateCreate,
      super.itemsActive,
      super.itemsCount,
      super.itemsDiscount,
      super.itemsPrice,
      super.itemsCategoriesId,
      super.isInCart,
      super.isInFav});

  factory ItemDetailModel.fromJson(Map<String, dynamic> json) {
    return ItemDetailModel(
      status: json['status'],
      rateStars: json["data"]['stars'],
      publicRate: double.parse(json["data"]['public_rating'] ?? '0.0'),
      itemsId: json["data"]['items_id'] ?? 0,
      itemsName: json["data"]['items_name'],
      itemsNameAr: json["data"]['items_name_ar'],
      itemsDescription: json["data"]['items_description'],
      itemsDescriptionAr: json["data"]['items_description_ar'],
      itemsImage: json["data"]['items_image'],
      itemsImage2: json["data"]['items_image2'] ?? "none",
      itemsImage3: json["data"]['items_image3'] ?? "none",
      itemsImage4: json["data"]['items_image4'] ?? "none",
      itemsDateCreate: json["data"]['items_date_create'],
      itemsActive: json["data"]['items_active'],
      itemsCount: json["data"]['items_count'],
      itemsDiscount: json["data"]['items_discount'],
      itemsPrice: json["data"]['items_price'],
      itemsCategoriesId: json["data"]['items_categories_id'],
      isInCart: json["data"]['isInCart'],
      isInFav: json["data"]["isInFav"],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['items_id'] = itemsId;
    data['items_name'] = itemsName;
    data['items_name_ar'] = itemsNameAr;
    data['items_description'] = itemsDescription;
    data['items_description_ar'] = itemsDescriptionAr;
    data['items_image'] = itemsImage;
    data['items_image2'] = itemsImage2;
    data['items_image3'] = itemsImage3;
    data['items_image4'] = itemsImage4;
    data['items_date_create'] = itemsDateCreate;
    data['items_active'] = itemsActive;
    data['items_count'] = itemsCount;
    data['items_discount'] = itemsDiscount;
    data['items_price'] = itemsPrice;
    data['items_categories_id'] = itemsCategoriesId;
    data['isInCart'] = isInCart;
    return data;
  }
}
// ItemDetailModel itemDetailModelFromJson(String str) =>
//     ItemDetailModel.fromJson(json.decode(str));
//
// String itemDetailModelToJson(ItemDetailModel data) =>
//     json.encode(data.toJson());
//
// class ItemDetailModel extends ItemDetailEntity {
//   ItemDetailModel({
//     required super.status,
//     super.itemsName,
//     super.itemsId,
//     super.itemsPrice,
//     super.itemsDescription,
//     super.itemsImage,
//     super.isInCart,
//     super.itemsActive,
//     super.itemsCategoriesId,
//     super.itemsCount,
//     super.itemsDateCreate,
//     super.itemsDescriptionAr,
//     super.itemsDiscount,
//     super.itemsImage2,
//     super.itemsImage3,
//     super.itemsImage4,
//     super.itemsNameAr,
//   });
//
//   factory ItemDetailModel.fromJson(Map<String, dynamic> json) {
//     if (json["status"] == "success") {
//       return ItemDetailModel(
//         status: json["status"],
//         itemsId: json["data"]["items_id"],
//         itemsName: json["data"]["items_name"],
//         itemsNameAr: json["data"]["items_name_ar"],
//         itemsDescription: json["data"]["items_description"],
//         itemsDescriptionAr: json["data"]["items_description_ar"],
//         itemsImage: json["data"]["items_image"],
//         itemsImage2: json["data"]["items_image2"] ?? "none",
//         itemsImage3: json["data"]["items_image3"] ?? "none",
//         itemsImage4: json["data"]["items_image4"] ?? "none",
//         itemsDateCreate: json["data"]["items_date_create"],
//         itemsActive: json["data"]["items_active"],
//         itemsCount: json["data"]["items_count"],
//         itemsDiscount: json["data"]["items_discount"],
//         itemsPrice: json["data"]["items_price"],
//         itemsCategoriesId: json["data"]["items_categories_id"],
//         isInCart: json["data"]["isInCart"] ?? 'none',
//       );
//     } else {
//       return ItemDetailModel(status: json["status"]);
//     }
//   }
//
//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "items_id": itemsId,
//         "items_name": itemsName,
//         "items_name_ar": itemsNameAr,
//         "items_description": itemsDescription,
//         "items_description_ar": itemsDescriptionAr,
//         "items_image": itemsImage,
//         "items_image2": itemsImage2,
//         "items_image3": itemsImage3,
//         "items_image4": itemsImage4,
//         "items_date_create": itemsDateCreate,
//         "items_active": itemsActive,
//         "items_count": itemsCount,
//         "items_discount": itemsDiscount,
//         "items_price": itemsPrice,
//         "items_categories_id": itemsCategoriesId,
//         "isInCart": isInCart,
//       };
// }
///***************************************
// class ItemDetailsModel extends ItemDetailEntity {
//   ItemDetailsModel({
//     required super.status,
//     required super.itemsId,
//     required super.itemsName,
//     required super.itemsNameAr,
//     required super.itemsDescription,
//     required super.itemsDescriptionAr,
//     required super.itemsImage,
//     required super.itemsImage2,
//     required super.itemsImage3,
//     required super.itemsImage4,
//     required super.itemsDateCreate,
//     required super.itemsActive,
//     required super.itemsCount,
//     required super.itemsDiscount,
//     required super.itemsPrice,
//     required super.itemsCategoriesId,
//     required super.isInCart,
//   });
//   // ItemDetailsModel.fromjson(Map<String, dynamic> json) {
//   //   super.status = json["status"];
//   //   super.itemsId = json["data"]["items_id"];
//   //   super.itemsName = json["data"]["items_name"];
//   //   super.itemsNameAr = json["data"]["items_name_ar"];
//   //   super.itemsDescription = json["data"]["items_description"];
//   //   super.itemsDescriptionAr = json["data"]["items_description_ar"];
//   //   super.itemsImage = json["data"]["items_image"];
//   //   super.itemsImage2 = json["data"]["items_image2"] ?? "none";
//   //   super.itemsImage3 = json["data"]["items_image3"] ?? "none";
//   //   super.itemsImage4 = json["data"]["items_image4"] ?? "none";
//   //   super.itemsDateCreate = json["data"]["items_date_create"];
//   //   super.itemsActive = json["data"]["items_active"];
//   //   super.itemsCount = json["data"]["items_count"];
//   //   super.itemsDiscount = json["data"]["items_discount"];
//   //   super.itemsPrice = json["data"]["items_price"];
//   //   super.itemsCategoriesId = json["data"]["items_categories_id"];
//   //   super.isInCart = json["data"]["isInCart"];
//   // }
// }
