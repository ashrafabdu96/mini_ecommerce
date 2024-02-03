import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';
import 'package:mini_ecommerce/features/home/home/domain/entities/CategoryItemsEntity.dart';
import 'package:mini_ecommerce/features/home/home/domain/use_cases/get_categories_usecase.dart';

part 'categories_state.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  final GetCategoriesUseCase getCategoriesUseCase;
  CategoriesCubit({required this.getCategoriesUseCase})
      : super(CategoriesInitialState());
  getAllCategories(BuildContext context) async {
    emit(CategoriesLoadingState());
    try {
      var result = await getCategoriesUseCase();
      emit(_mapFailureOrCategoryItemsEntityToState(result, context));
    } catch (e) {
      emit(_mapFailureOrCategoryItemsEntityToState(
          Left(ServerFailure()), context));
    }
  }

  ///helpers
  CategoriesState _mapFailureOrCategoryItemsEntityToState(
      Either<Failure, CategoryItemsEntity> either, BuildContext context) {
    return either.fold(
      (failure) => CategoriesErrorState(
        status: _mapFailureToMessage(
          failure,
          context,
        ),
      ),
      (categoryItemsEntity) {
        return CategoriesSuccessState(categoryItemsEntity: categoryItemsEntity);
      },
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
