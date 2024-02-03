import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/features/payment/domain/entities/address_entities/address_entity.dart';
import 'package:mini_ecommerce/features/payment/domain/repositories/base_payment_repository.dart';

class UpdateAddressPayUseCase {
  final BasePaymentRepository basePaymentRepository;

  UpdateAddressPayUseCase({required this.basePaymentRepository});
  Future<Either<Failure, Unit>> call(
      {required AddressEntity addressEntity}) async {
    return await basePaymentRepository.updateAddress(
        addressEntity: addressEntity);
  }
}
