import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/features/product_details/domain/repositories/base_item_detail_repository.dart';

class AddOrUpdateReviewUseCase {
  final BaseItemDetailsRepository baseItemDetailsRepository;
  AddOrUpdateReviewUseCase({required this.baseItemDetailsRepository});

  Future<Either<Failure, Map<String, dynamic>>> call(
      {required int itemId,
      required int userId,
      String? content,
      int? stars}) async {
    return await baseItemDetailsRepository.addOrUpdateReview(
        itemId: itemId, userId: userId, content: content, stars: stars);
  }
}
