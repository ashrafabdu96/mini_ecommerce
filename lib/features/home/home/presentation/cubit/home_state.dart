part of 'home_cubit.dart';

@immutable
abstract class HomeState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class HomeInitialState extends HomeState {}

class HomeLoadingState extends HomeState {}

class HomeSuccessState extends HomeState {
  final HomeEntity homeEntity;
  final List<AllItemsEntity>? allItems;

  HomeSuccessState({required this.homeEntity, this.allItems});
  @override
  // TODO: implement props
  List<Object?> get props => [homeEntity];
}

class HomeErrorState extends HomeState {
  final String status;

  HomeErrorState({required this.status});
}

class HomeRefreshState extends HomeState {}
