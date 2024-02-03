part of 'order_cubit.dart';

@immutable
abstract class OrderState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class OrderInitialState extends OrderState {}

class OrderLoadingState extends OrderState {}

class OrderErrorState extends OrderState {
  final String status;

  OrderErrorState({required this.status});
  @override
  // TODO: implement props
  List<Object?> get props => [status];
}

class OrderSuccessState extends OrderState {
  final HeadOrderEntity headOrderEntity;

  OrderSuccessState({required this.headOrderEntity});
  @override
  // TODO: implement props
  List<Object?> get props => [headOrderEntity];
}
