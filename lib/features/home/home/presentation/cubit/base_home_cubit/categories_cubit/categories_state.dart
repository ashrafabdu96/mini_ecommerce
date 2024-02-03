part of 'categories_cubit.dart';

@immutable
abstract class CategoriesState extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class CategoriesInitialState extends CategoriesState {}

class CategoriesSuccessState extends CategoriesState {
  final CategoryItemsEntity categoryItemsEntity;
  CategoriesSuccessState({required this.categoryItemsEntity});
  @override
  // TODO: implement props
  List<Object?> get props => [categoryItemsEntity];
}

class CategoriesLoadingState extends CategoriesState {}

class CategoriesErrorState extends CategoriesState {
  final String status;
  CategoriesErrorState({required this.status});
}
