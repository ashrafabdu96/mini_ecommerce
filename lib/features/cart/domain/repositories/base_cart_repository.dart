import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/features/cart/domain/entities/cart_entity.dart';
import 'package:mini_ecommerce/features/cart/domain/entities/cart_operation_entity.dart';

abstract class BaseCartRepository {
  Future<Either<Failure, CartEntity>> getCartData(int userId);
  Future<Either<Failure, CartOperationEntity>> deleteFromCart(
      String userId, String itemId);
  Future<Either<Failure, CartOperationEntity>> updateCartItemQuantity(
      int quantity, int itemId);
}
