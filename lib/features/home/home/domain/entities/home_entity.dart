import 'package:equatable/equatable.dart';

abstract class BaseItemEntity {
  String? stars;
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDescription;
  String? itemsDescriptionAr;
  String? itemsImage;
  String? itemsImage2;
  String? itemsImage3;
  String? itemsImage4;
  String? itemsDateCreate;
  int? itemsActive;
  int? itemsCount;
  int? itemsDiscount;
  int? itemsPrice;
  int? itemsCategoriesId;
  String? isInCart;
  String? isInFav;
  BaseItemEntity(
      {this.stars,
      this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsDescription,
      this.itemsDescriptionAr,
      this.itemsImage,
      this.itemsImage2,
      this.itemsImage3,
      this.itemsImage4,
      this.itemsDateCreate,
      this.itemsActive,
      this.itemsCount,
      this.itemsDiscount,
      this.itemsPrice,
      this.itemsCategoriesId,
      this.isInCart,
      this.isInFav});
}

class HomeEntity extends Equatable {
  String? status;
  List<CategoriesEntity>? categories;
  List<ItemsEntity>? items;
  List<AllItemsEntity>? allItems;

  HomeEntity({this.status, this.categories, this.items, this.allItems});

  @override
  // TODO: implement props
  List<Object?> get props => [
        status,
        categories,
        items,
        allItems,
      ];
}

class CategoriesEntity {
  int? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDateCreate;
  String? categoriesDescription;

  CategoriesEntity(
      {this.categoriesId,
      this.categoriesName,
      this.categoriesNameAr,
      this.categoriesImage,
      this.categoriesDateCreate,
      this.categoriesDescription});
}

class ItemsEntity extends BaseItemEntity {
  ItemsEntity({
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
    super.isInFav,
    super.stars,
  });

  @override
  String toString() {
    return '{  itemsId: $itemsId, itemsName: $itemsName,itemsNameAr:$itemsNameAr,itemsDescription: $itemsDescription,itemsDescriptionAr: $itemsDescriptionAr,itemsImage:$itemsImage,itemsImage2: $itemsImage2,itemsImage3:$itemsImage3,itemsImage4:$itemsImage4 ,itemsDateCreate:$itemsDateCreate ,isInCart: $isInCart,itemsActive: $itemsActive,itemsCount: $itemsCount,itemsDiscount: $itemsDiscount,itemsCategoriesId: $itemsCategoriesId,itemsPrice:$itemsPrice,isInFav:$isInFav,stars:$stars}';
  }
}

class AllItemsEntity extends BaseItemEntity {
  AllItemsEntity(
      {super.itemsId,
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
      super.isInFav,
      super.stars});
  @override
  String toString() {
    return '{  itemsId: $itemsId, itemsName: $itemsName,itemsNameAr:$itemsNameAr,itemsDescription: $itemsDescription,itemsDescriptionAr: $itemsDescriptionAr,itemsImage:$itemsImage,itemsImage2: $itemsImage2,itemsImage3:$itemsImage3,itemsImage4:$itemsImage4 ,itemsDateCreate:$itemsDateCreate ,isInCart: $isInCart,itemsActive: $itemsActive,itemsCount: $itemsCount,itemsDiscount: $itemsDiscount,itemsCategoriesId: $itemsCategoriesId,itemsPrice:$itemsPrice,isInFav:$isInFav,stars:$stars}';
  }
}
