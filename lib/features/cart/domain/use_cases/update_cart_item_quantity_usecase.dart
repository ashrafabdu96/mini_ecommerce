import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/features/cart/domain/entities/cart_operation_entity.dart';
import 'package:mini_ecommerce/features/cart/domain/repositories/base_cart_repository.dart';

class UpdateCartItemUseCase {
  final BaseCartRepository baseCartRepository;

  UpdateCartItemUseCase({required this.baseCartRepository});
  Future<Either<Failure, CartOperationEntity>> call(
      int quantity, int itemId) async {
    return await baseCartRepository.updateCartItemQuantity(quantity, itemId);
  }
}
