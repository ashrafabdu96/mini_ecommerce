import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/features/orders/domain/entities/order_details_entity.dart';
import 'package:mini_ecommerce/features/orders/domain/entities/order_entity.dart';

abstract class BaseOrderRepository {
  Future<Either<Failure, HeadOrderEntity>> getOrders({required String where});
  Future<Either<Failure, OrderDetailsEntity>> getOrderDetails(
      {required int orderId});
}
