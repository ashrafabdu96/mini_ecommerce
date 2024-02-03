part of 'payment_address_cubit.dart';

@immutable
abstract class PaymentAddressState {}

class PaymentAddressInitialState extends PaymentAddressState {}

class PaymentAddressLoadingState extends PaymentAddressState {}

class PaymentAddressErrorState extends PaymentAddressState {
  final String status;

  PaymentAddressErrorState({required this.status});
}

class PaymentAddressSuccessState extends PaymentAddressState {
  final AddressEntity addressEntity;
  PaymentAddressSuccessState({required this.addressEntity});
}

class PaymentAddOrUpdateAddressSuccessState extends PaymentAddressState {}

class PaymentAddOrUpdateAddressFailState extends PaymentAddressState {}
