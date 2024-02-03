import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/features/cart/domain/entities/cart_entity.dart';
import 'package:mini_ecommerce/features/payment/domain/repositories/base_payment_repository.dart';

class AddPaymentOrderUseCase {
  final BasePaymentRepository basePaymentRepository;

  AddPaymentOrderUseCase({required this.basePaymentRepository});
  Future<Either<Failure, Unit>> call({
    required int userId,
    required double total,
    // required List<BaseItemEntity> cartDataEntityList,
    required List<CartDataEntity> cartDataEntityList,
    // required Map<String?, dynamic> orderJson,
  }) async {
    return await basePaymentRepository.addAllOrderItems(
      userId: userId,
      // orderJson: orderJson,
      total: total,
      cartDataEntityList: cartDataEntityList,
    );
  }
}
