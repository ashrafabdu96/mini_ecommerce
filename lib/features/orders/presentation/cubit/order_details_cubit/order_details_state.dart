part of 'order_details_cubit.dart';

@immutable
abstract class OrderDetailsState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class OrderDetailsInitialState extends OrderDetailsState {}

class OrderDetailsLoadingState extends OrderDetailsState {}

class OrderDetailsSuccessState extends OrderDetailsState {
  final OrderDetailsEntity orderDetailsEntity;

  OrderDetailsSuccessState({required this.orderDetailsEntity});
  @override
  // TODO: implement props
  List<Object?> get props => [orderDetailsEntity];
}

class OrderDetailsErrorState extends OrderDetailsState {
  final String status;

  OrderDetailsErrorState({required this.status});
  @override
  // TODO: implement props
  List<Object?> get props => [status];
}
