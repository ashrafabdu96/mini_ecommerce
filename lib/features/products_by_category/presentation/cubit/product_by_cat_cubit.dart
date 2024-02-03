import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';
import 'package:mini_ecommerce/features/products_by_category/domain/entities/product_by_cat_entity.dart';
import 'package:mini_ecommerce/features/products_by_category/domain/use_cases/get_data_by_cat_usecase.dart';

part 'product_by_cat_state.dart';

class ProductByCatCubit extends Cubit<ProductByCatState> {
  ProductByCatCubit({required this.getDataByCatUseCase})
      : super(ProductByCatInitialState());
  final GetDataByCatUseCase getDataByCatUseCase;
  int catId = 0;
  getDataByCat(int userId, int categoryId, BuildContext context) async {
    try {
      catId = categoryId;
      var result = await getDataByCatUseCase(userId, categoryId);
      // print("cubit--> $result");
      emit(_mapFailureOrItemDetailEntityToState(result, context));
    } catch (e) {
      emit(
          _mapFailureOrItemDetailEntityToState(Left(ServerFailure()), context));
    }
  }

  ///***helpers
  ProductByCatState _mapFailureOrItemDetailEntityToState(
      Either<Failure, ProductByCatEntity> either, BuildContext context) {
    return either.fold(
      (failure) => ProductByCatErrorState(
        status: _mapFailureToMessage(
          failure,
          context,
        ),
      ),
      (productByCatEntity) =>
          ProductByCatSuccessState(productByCatEntity: productByCatEntity),
    );
  }

  String _mapFailureToMessage(Failure failure, BuildContext context) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "serverFailure".tr(context);
      case OfflineFailure:
        return "offlineFailure".tr(context);
      case NotFoundFailure:
        return "no_data_found".tr(context);
      default:
        return "unExpectedFailure".tr(context);
    }
  }
}
