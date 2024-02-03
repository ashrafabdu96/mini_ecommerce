import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/features/cart/domain/entities/cart_operation_entity.dart';
import 'package:mini_ecommerce/features/cart/domain/repositories/base_cart_repository.dart';

class DeleteCartUseCase {
  final BaseCartRepository baseCartRepository;

  DeleteCartUseCase({required this.baseCartRepository});
  Future<Either<Failure, CartOperationEntity>> call(
      String userId, String itemId) async {
    return await baseCartRepository.deleteFromCart(userId, itemId);
  }
}
