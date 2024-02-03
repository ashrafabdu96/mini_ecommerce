import 'package:mini_ecommerce/features/home/home/domain/entities/home_entity.dart';

class HomeModel extends HomeEntity {
  HomeModel(
      {super.status = "", super.categories, super.items, super.allItems}) {}
  HomeModel.fromJson(Map<String, dynamic> json) {
    // categories!.clear();
    // allItems!.clear();
    // items!.clear();

    status = json['status'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(Categories.fromJson(v));
      });
    }
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
    if (json['all_items'] != null) {
      allItems = <AllItems>[];
      json['all_items'].forEach((v) {
        allItems!.add(AllItems.fromJson(v));
      });
    }
  }

// Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['status'] = status;
  //   if (categories != null) {
  //     data['categories'] = categories!.map((v) => v.toJson()).toList();
  //   }
  //   if (items != null) {
  //     data['items'] = items!.map((v) => v.toJson()).toList();
  //   }
  //   if (allItems != null) {
  //     data['all_items'] = allItems!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class Categories extends CategoriesEntity {
  Categories(
      {super.categoriesId,
      super.categoriesName,
      super.categoriesNameAr,
      super.categoriesImage,
      super.categoriesDateCreate,
      super.categoriesDescription});

  factory Categories.fromJson(Map<String, dynamic> json) {
    return Categories(
      categoriesId: json['categories_id'],
      categoriesName: json['categories_name'],
      categoriesNameAr: json['categories_name_ar'],
      categoriesImage: json['categories_image'],
      categoriesDescription: json['categories_description'],
      categoriesDateCreate: json['categories_date_create'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categories_id'] = categoriesId;
    data['categories_name'] = categoriesName;
    data['categories_name_ar'] = categoriesNameAr;
    data['categories_image'] = categoriesImage;
    data['categories_date_create'] = categoriesDateCreate;
    data['categories_description'] = categoriesDescription;
    return data;
  }
}

class Items extends ItemsEntity {
  Items({
    super.stars,
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
  });

  factory Items.fromJson(Map<String, dynamic> json) {
    return Items(
      itemsId: json['items_id'],
      stars: json['stars'],
      itemsName: json['items_name'],
      itemsNameAr: json['items_name_ar'],
      itemsDescription: json['items_description'],
      itemsDescriptionAr: json['items_description_ar'],
      itemsImage: json['items_image'],
      itemsImage2: json['items_image2'],
      itemsImage3: json['items_image3'],
      itemsImage4: json['items_image4'],
      itemsDateCreate: json['items_date_create'],
      isInCart: json['isInCart'],
      isInFav: json['isInFav'],
      itemsActive: json['items_active'],
      itemsCount: json['items_count'],
      itemsDiscount: json['items_discount'],
      itemsCategoriesId: json['items_categories_id'],
      itemsPrice: json['items_price'],
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
    data['isInFav'] = isInFav;
    return data;
  }
}

class AllItems extends AllItemsEntity {
  AllItems({
    super.stars,
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
  });

  factory AllItems.fromJson(Map<String, dynamic> json) {
    return AllItems(
      stars: json['stars'],
      itemsId: json['items_id'],
      itemsName: json['items_name'],
      itemsNameAr: json['items_name_ar'],
      itemsDescription: json['items_description'],
      itemsDescriptionAr: json['items_description_ar'],
      itemsImage: json['items_image'],
      itemsImage2: json['items_image2'],
      itemsImage3: json['items_image3'],
      itemsImage4: json['items_image4'],
      itemsDateCreate: json['items_date_create'],
      isInCart: json['isInCart'],
      isInFav: json['isInFav'],
      itemsActive: json['items_active'],
      itemsCount: json['items_count'],
      itemsDiscount: json['items_discount'],
      itemsCategoriesId: json['items_categories_id'],
      itemsPrice: json['items_price'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['items_id'] = itemsId;
    data['stars'] = stars;
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
    data['isInFav'] = isInFav;
    return data;
  }
}
