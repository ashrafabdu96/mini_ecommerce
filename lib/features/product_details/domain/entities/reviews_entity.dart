class ReviewsEntity {
  ReviewsEntity({
    this.status,
    this.reviewsDataEntity,
  });
  String? status;
  List<ReviewsDataEntity>? reviewsDataEntity;
}

class ReviewsDataEntity {
  ReviewsDataEntity({
    this.stars,
    this.content,
    this.usersName,
  });
  int? stars;
  String? content;
  String? usersName;
}
