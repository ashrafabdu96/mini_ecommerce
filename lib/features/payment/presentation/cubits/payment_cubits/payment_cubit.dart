import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/features/cart/domain/entities/cart_entity.dart';
import 'package:mini_ecommerce/features/payment/domain/entities/payment_entities/payment_entity.dart';
import 'package:mini_ecommerce/features/payment/domain/use_cases/add_payment_info_usecase.dart';
import 'package:mini_ecommerce/features/payment/domain/use_cases/add_payment_order.dart';
import 'package:mini_ecommerce/injection_container.dart';

part 'payment_state.dart';

class PaymentCubit extends Cubit<PaymentState> {
  PaymentCubit(
      {required this.addPaymentOrderUseCase,
      required this.addPaymentInfoUseCase})
      : super(PaymentInitialState());
  final AddPaymentInfoUseCase addPaymentInfoUseCase;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController senderNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController remittanceNumberController =
      TextEditingController();
  final AddPaymentOrderUseCase addPaymentOrderUseCase;
// final cubit = BlocProvider.of<PaymentCubit>(context);
  Future<String?> addPaymentInformation({
    required int amount,
    required int paymentTypeId,
    required BuildContext context,
  }) async {
    final currentStat = formKey.currentState?.validate();
    if (currentStat != null && currentStat == true) {
      PaymentEntity paymentEntity = PaymentEntity(
        userIdPay: getUserId(),
        senderName: senderNameController.text,
        amount: amount.toString(),
        accountNumber: "",
        phoneNumber: phoneNumberController.text,
        payTypeId: paymentTypeId.toString(),
        remittanceNumber: remittanceNumberController.text,
      );
      await addPaymentInfo(context: context, paymentEntity: paymentEntity);
    } else {
      return "you have to select the payment method";
    }
    return null;
  }

  verifyPaymentApproval() {
    emit(VerifyPaymentApprovalState());
  }

  addPaymentInfo(
      {required BuildContext context,
      required PaymentEntity paymentEntity}) async {
    try {
      emit(PaymentLoadingState());
      final result = await addPaymentInfoUseCase(paymentEntity: paymentEntity);
      emit(_mapFailureOrUnitToState(result, context));
    } catch (e) {
      print(e.toString());
      // emit(_mapFailureOrUnitToState(, context));

    }
  }

  addPaymentOrder({
    required double total,
    // required Map<String?, dynamic> orderJson,
    // required List<BaseItemEntity> cartDataEntityList,
    required List<CartDataEntity> cartDataEntityList,
    required BuildContext context,
  }) async {
    try {
      emit(PaymentLoadingState());
      final result = await addPaymentOrderUseCase(
          total: total,
          userId: int.parse(getUserId()),
          cartDataEntityList: cartDataEntityList);
      emit(_mapFailureOrUnitToState(result, context));
    } catch (e) {
      print(e.toString());
      // emit(_mapFailureOrUnitToState(, context));
    }
  }

  PaymentState _mapFailureOrUnitToState(
      Either<Failure, Unit> either, BuildContext context) {
    return either.fold(
      (failure) {
        return PaymentFailureState(
            // status: _mapFailureToMessage(failure, context),
            );
      },
      (unit) {
        return PaymentSuccessState();
      },
    );
  }
}
