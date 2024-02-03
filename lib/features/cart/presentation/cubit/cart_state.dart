part of 'cart_cubit.dart';

@immutable
abstract class CartState {}

class CartInitialState extends CartState {}

class CartLoadingState extends CartState {}

class CartSuccessState extends CartState {
  final CartEntity cartEntity;

  CartSuccessState({required this.cartEntity});
  @override
  // TODO: implement props
  List<Object?> get props => [cartEntity];
}

class CartErrorState extends CartState {
  final String status;
  CartErrorState({required this.status});
}

class CartDeleteSuccessState extends CartState {
  final CartOperationEntity cartOperationEntity;
  CartDeleteSuccessState({required this.cartOperationEntity});
}

class CartDeleteErrorState extends CartState {
  final String status;
  CartDeleteErrorState({required this.status});
}

class IncrementCartState extends CartState {
  int quantityIn;

  IncrementCartState({required this.quantityIn});
  // increment(int q) {
  //   quantityIn += 1;
  // }
}

class DecrementCartState extends CartState {
  int quantityDe;
  DecrementCartState({required this.quantityDe});
  // decrement(int q) {
  //   quantityDe -= 1;
  // }
}
