import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/features/payment/domain/entities/address_entities/address_entity.dart';
import 'package:mini_ecommerce/features/payment/domain/entities/address_entities/region_entity.dart';
import 'package:mini_ecommerce/features/payment/domain/entities/payment_entities/payment_entity.dart';

import '../../../cart/domain/entities/cart_entity.dart';

abstract class BasePaymentRepository {
  Future<Either<Failure, AddressEntity>> getAddress({required int userId});
  Future<Either<Failure, RegionEntity>> getRegion({required int cityId});
  Future<Either<Failure, Unit>> addAddress(
      {required AddressEntity addressEntity});
  Future<Either<Failure, Unit>> updateAddress(
      {required AddressEntity addressEntity});
  Future<Either<Failure, Unit>> addPaymentInfo(
      {required PaymentEntity paymentEntity});
  Future<Either<Failure, Unit>> addAllOrderItems({
    required int userId,
    required double total,
    // required List<BaseItemEntity> cartDataEntityList,
    required List<CartDataEntity> cartDataEntityList,
    // required Map<String?, dynamic> orderJson,
  });
}
