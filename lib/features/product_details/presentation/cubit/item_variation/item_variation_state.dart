part of 'item_variation_cubit.dart';

abstract class ItemVariationState extends Equatable {
  const ItemVariationState();
  @override
  List<Object> get props => [];
}

class ItemVariationInitialState extends ItemVariationState {}

class ItemVariationLoadingState extends ItemVariationState {}

class ItemVariationErrorState extends ItemVariationState {
  final String status;

  const ItemVariationErrorState({required this.status});
  @override
  List<Object> get props => [status];
}

class ItemVariationSuccessState extends ItemVariationState {
  final ItemVariationEntity itemVariationEntity;

  const ItemVariationSuccessState({required this.itemVariationEntity});
  @override
  List<Object> get props => [itemVariationEntity];
}
