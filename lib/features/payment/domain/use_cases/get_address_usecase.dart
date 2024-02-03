import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/features/payment/domain/entities/address_entities/address_entity.dart';
import 'package:mini_ecommerce/features/payment/domain/repositories/base_payment_repository.dart';

class GetAddressUseCase {
  final BasePaymentRepository basePaymentRepository;
  GetAddressUseCase({required this.basePaymentRepository});
  Future<Either<Failure, AddressEntity>> call({required int userId}) async {
    return await basePaymentRepository.getAddress(userId: userId);
  }
}
