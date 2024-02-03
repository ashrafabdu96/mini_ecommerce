import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/features/cart/domain/entities/cart_entity.dart';
import 'package:mini_ecommerce/features/cart/domain/repositories/base_cart_repository.dart';

class GetCartDataUseCase {
  final BaseCartRepository baseCartRepository;
  GetCartDataUseCase({required this.baseCartRepository});
  Future<Either<Failure, CartEntity>> call(int userId) async =>
      await baseCartRepository.getCartData(userId);
}
