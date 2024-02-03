import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/features/address/domain/entities/address_region_entity.dart';
import 'package:mini_ecommerce/features/address/domain/repositories/base_address_repository.dart';

class GetAddressRegionUseCase {
  final BaseAddressRepository baseAddressRepository;

  GetAddressRegionUseCase({required this.baseAddressRepository});
  Future<Either<Failure, RegionEntity>> call(int cityId) async {
    return await baseAddressRepository.getAddressRegionInfo(cityId);
  }
}
