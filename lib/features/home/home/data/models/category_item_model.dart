import 'package:mini_ecommerce/features/home/home/domain/entities/CategoryItemsEntity.dart';

class CategoryItemsModel extends CategoryItemsEntity {
  CategoryItemsModel({
    super.status,
    super.categoryItems,
  });
  CategoryItemsModel.fromJson(dynamic json) {
    status = json['status'];
    if (json['data'] != null) {
      categoryItems = <CategoryItemModel>[];
      json['data'].forEach((v) {
        categoryItems?.add(CategoryItemModel.fromJson(v));
      });
    }
  }
}

class CategoryItemModel extends CategoryItemEntity {
  CategoryItemModel({
    super.categoriesId,
    super.categoriesName,
    super.categoriesNameAr,
    super.categoriesImage,
    super.categoriesDateCreate,
    super.categoriesDescription,
  });

  CategoryItemModel.fromJson(dynamic json) {
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesImage = json['categories_image'];
    categoriesDateCreate = json['categories_date_create'];
    categoriesDescription = json['categories_description'];
  }
}
