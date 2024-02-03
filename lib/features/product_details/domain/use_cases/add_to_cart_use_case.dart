import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/features/product_details/domain/entities/item_detail_operation_entity.dart';
import 'package:mini_ecommerce/features/product_details/domain/repositories/base_item_detail_repository.dart';

class AddToCartUseCase {
  final BaseItemDetailsRepository baseItemDetailsRepository;
  AddToCartUseCase({required this.baseItemDetailsRepository});

  Future<Either<Failure, ItemDetailOperationEntity>> call(
      String userId, String itemId) async {
    return await baseItemDetailsRepository.addToCart(userId, itemId);
  }
}
