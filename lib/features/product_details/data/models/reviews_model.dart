import 'package:mini_ecommerce/features/product_details/domain/entities/reviews_entity.dart';

class ReviewsModel extends ReviewsEntity {
  ReviewsModel({super.status, super.reviewsDataEntity}) {
    super.reviewsDataEntity as ReviewsDataModel;
  }

  ReviewsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      reviewsDataEntity = <ReviewsDataModel>[];
      json['data'].forEach((v) {
        reviewsDataEntity!.add(ReviewsDataModel.fromJson(v));
      });
    }
  }
  //
  // Map<String, dynamic> toJson() {
  //   final Map<String, dynamic> data = <String, dynamic>{};
  //   data['status'] = status;
  //   if (reviewsDataEntity != null) {
  //     data['data'] = reviewsDataEntity!.map((v) => v.toJson()).toList();
  //   }
  //   return data;
  // }
}

class ReviewsDataModel extends ReviewsDataEntity {
  ReviewsDataModel({
    super.stars,
    super.content,
    super.usersName,
  });

  ReviewsDataModel.fromJson(Map<String, dynamic> json) {
    stars = json['stars'];
    content = json['content'];
    usersName = json['users_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['stars'] = stars;
    data['content'] = content;
    data['users_name'] = usersName;
    return data;
  }
}
