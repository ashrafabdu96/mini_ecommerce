import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/features/product_details/domain/repositories/base_item_detail_repository.dart';

class CheckBeforeRateUseCase {
  final BaseItemDetailsRepository baseItemDetailsRepository;
  CheckBeforeRateUseCase({required this.baseItemDetailsRepository});

  Future<Either<Failure, Unit>> call(
      {required int userId, required int itemId}) async {
    return await baseItemDetailsRepository.checkBeforeRate(
        itemId: itemId, userId: userId);
  }
}
