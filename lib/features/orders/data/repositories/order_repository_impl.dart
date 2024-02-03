import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/exceptions.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/core/helpers/network_info.dart';
import 'package:mini_ecommerce/features/orders/data/data_sources/order_remote_data_source.dart';
import 'package:mini_ecommerce/features/orders/data/models/head_order_model.dart';
import 'package:mini_ecommerce/features/orders/data/models/order_details_model.dart';
import 'package:mini_ecommerce/features/orders/domain/entities/order_details_entity.dart';
import 'package:mini_ecommerce/features/orders/domain/entities/order_entity.dart';
import 'package:mini_ecommerce/features/orders/domain/repositories/base_order_repository.dart';

class OrderRepositoryImpl extends BaseOrderRepository {
  final OrderRemoteDataSourceImpl orderRemoteDataSourceImpl;
  final NetworkInfoImpl networkInfo;

  OrderRepositoryImpl(
      {required this.orderRemoteDataSourceImpl, required this.networkInfo});

  @override
  Future<Either<Failure, HeadOrderEntity>> getOrders(
      {required String where}) async {
    if (await networkInfo.isConnected) {
      try {
        final HeadOrderModel headOrderModel =
            await orderRemoteDataSourceImpl.getOrders(where: where);
        if (headOrderModel.status == "success") {
          print('==========>success');
          return Right(headOrderModel);
        } else {
          print('==========>ffffoooooo');
          return Left(NotFoundFailure());
        }
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }

  @override
  Future<Either<Failure, OrderDetailsEntity>> getOrderDetails(
      {required int orderId}) async {
    if (await networkInfo.isConnected) {
      try {
        final OrderDetailsModel orderDetailsModel =
            await orderRemoteDataSourceImpl.getOrderDetails(orderId: orderId);
        if (orderDetailsModel.status == "success") {
          print('==========>success');
          return Right(orderDetailsModel);
        } else {
          print('==========>ffffoooooo');
          return Left(NotFoundFailure());
        }
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(OfflineFailure());
    }
  }
}
