part of 'product_by_cat_cubit.dart';

@immutable
abstract class ProductByCatState {}

class ProductByCatInitialState extends ProductByCatState {}

class ProductByCatLoadingState extends ProductByCatState {}

class ProductByCatErrorState extends ProductByCatState {
  final String status;

  ProductByCatErrorState({required this.status});
}

class ProductByCatSuccessState extends ProductByCatState {
  final ProductByCatEntity productByCatEntity;

  ProductByCatSuccessState({required this.productByCatEntity});
}
