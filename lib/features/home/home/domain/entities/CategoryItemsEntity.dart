import 'package:equatable/equatable.dart';

class CategoryItemsEntity extends Equatable {
  CategoryItemsEntity({
    this.status,
    this.categoryItems,
  });
  String? status;
  List<CategoryItemEntity>? categoryItems;

  @override
  // TODO: implement props
  List<Object?> get props => [
        status,
        categoryItems,
      ];
}

class CategoryItemEntity {
  CategoryItemEntity({
    this.categoriesId,
    this.categoriesName,
    this.categoriesNameAr,
    this.categoriesImage,
    this.categoriesDateCreate,
    this.categoriesDescription,
  });

  int? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDateCreate;
  String? categoriesDescription;
}
