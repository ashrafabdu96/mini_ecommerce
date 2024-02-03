part of 'item_detail_cubit.dart';

@immutable
abstract class ItemDetailState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class ItemDetailInitialState extends ItemDetailState {}

class ItemDetailLoadingState extends ItemDetailState {}

class ItemDetailRefreshState extends ItemDetailState {}

class ItemDetailSuccessState extends ItemDetailState {
  final ItemDetailEntity itemDetailEntity;

  ItemDetailSuccessState({required this.itemDetailEntity});
}

class ItemDetailErrorState extends ItemDetailState {
  final String status;

  ItemDetailErrorState({required this.status});
}
