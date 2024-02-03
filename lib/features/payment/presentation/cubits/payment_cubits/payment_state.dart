part of 'payment_cubit.dart';

abstract class PaymentState extends Equatable {
  const PaymentState();
  @override
  List<Object> get props => [];
}

class PaymentInitialState extends PaymentState {}

class PaymentLoadingState extends PaymentState {}

class VerifyPaymentApprovalState extends PaymentState {}

class PaymentSuccessState extends PaymentState {}

class PaymentFailureState extends PaymentState {}
