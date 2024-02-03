import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/features/payment/domain/entities/address_entities/region_entity.dart';
import 'package:mini_ecommerce/features/payment/domain/repositories/base_payment_repository.dart';

class GetRegionUseCase {
  final BasePaymentRepository basePaymentRepository;
  GetRegionUseCase({required this.basePaymentRepository});
  Future<Either<Failure, RegionEntity>> call({required int cityId}) async {
    return await basePaymentRepository.getRegion(cityId: cityId);
  }
}
