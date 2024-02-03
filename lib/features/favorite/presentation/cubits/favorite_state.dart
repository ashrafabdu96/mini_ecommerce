part of 'favorite_cubit.dart';

@immutable
abstract class FavoriteState {}

class FavoriteInitialState extends FavoriteState {}

class FavoriteLoadingState extends FavoriteState {}

class FavoriteSuccessState extends FavoriteState {
  final FavoriteEntity favoriteEntity;

  FavoriteSuccessState({required this.favoriteEntity});
  @override
  // TODO: implement props
  List<Object?> get props => [favoriteEntity];
}

class FavoriteErrorState extends FavoriteState {
  final String status;
  FavoriteErrorState({required this.status});
}

//******************************************
//operations State
class FavoriteDeleteSuccessState extends FavoriteState {
  final FavoriteOperationEntity favoriteOperationEntity;
  FavoriteDeleteSuccessState({required this.favoriteOperationEntity});
}

class FavoriteDeleteErrorState extends FavoriteState {
  final String status;
  FavoriteDeleteErrorState({required this.status});
}

class FavoriteAddErrorState extends FavoriteState {
  final String status;
  FavoriteAddErrorState({required this.status});
}

class FavoriteAddSuccessState extends FavoriteState {
  final FavoriteOperationEntity favoriteOperationEntity;

  FavoriteAddSuccessState({required this.favoriteOperationEntity});
}
