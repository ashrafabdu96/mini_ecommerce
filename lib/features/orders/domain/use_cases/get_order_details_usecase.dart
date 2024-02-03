import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/features/orders/domain/entities/order_details_entity.dart';
import 'package:mini_ecommerce/features/orders/domain/repositories/base_order_repository.dart';

class GetOrderDetailsUseCase {
  final BaseOrderRepository baseOrderRepository;

  GetOrderDetailsUseCase({required this.baseOrderRepository});
  Future<Either<Failure, OrderDetailsEntity>> call(
          {required int orderId}) async =>
      await baseOrderRepository.getOrderDetails(orderId: orderId);
}
