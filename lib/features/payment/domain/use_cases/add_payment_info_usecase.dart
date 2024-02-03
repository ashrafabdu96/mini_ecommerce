import 'package:dartz/dartz.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/features/payment/domain/entities/payment_entities/payment_entity.dart';
import 'package:mini_ecommerce/features/payment/domain/repositories/base_payment_repository.dart';

class AddPaymentInfoUseCase {
  final BasePaymentRepository basePaymentRepository;

  AddPaymentInfoUseCase({required this.basePaymentRepository});
  Future<Either<Failure, Unit>> call(
      {required PaymentEntity paymentEntity}) async {
    return await basePaymentRepository.addPaymentInfo(
        paymentEntity: paymentEntity);
  }
}
