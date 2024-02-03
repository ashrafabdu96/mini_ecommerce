import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/features/product_details/domain/repositories/base_item_detail_repository.dart';

import '../entities/reviews_entity.dart';

class GetItemReviewsUseCase {
  final BaseItemDetailsRepository baseItemDetailsRepository;

  GetItemReviewsUseCase({
    required this.baseItemDetailsRepository,
  });

  Future<Either<Failure, ReviewsEntity>> call({required int itemId}) async {
    return await baseItemDetailsRepository.getItemReviews(itemId: itemId);
  }
}
