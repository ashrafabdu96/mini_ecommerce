part of 'item_details_operation_cubit.dart';

@immutable
abstract class ItemDetailsOperationState {}

class ItemDetailsOperationInitialState extends ItemDetailsOperationState {}

class ItemDetailsOperationSuccessState extends ItemDetailsOperationState {}

class ItemDetailsOperationErrorState extends ItemDetailsOperationState {
  final String status;

  ItemDetailsOperationErrorState({required this.status});
}
