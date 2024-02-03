import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';
import 'package:mini_ecommerce/features/product_details/domain/entities/item_details_entity.dart';
import 'package:mini_ecommerce/features/product_details/domain/use_cases/get_data_item_details_use_case.dart';

part 'item_detail_state.dart';

class ItemDetailCubit extends Cubit<ItemDetailState> {
  ItemDetailCubit({
    required this.getDataItemDetailsUseCase,
  }) : super(ItemDetailInitialState());
  GetDataItemDetailsUseCase getDataItemDetailsUseCase;

  refreshes() {
    emit(ItemDetailInitialState());
  }

  getData(int itemId, BuildContext context) async {
    emit(ItemDetailLoadingState());

    try {
      emit(ItemDetailLoadingState());

      var result = await getDataItemDetailsUseCase(itemId);
      // print("cubit--> $result");

      emit(_mapFailureOrItemDetailEntityToState(result, context));
    } catch (e) {
      emit(
          _mapFailureOrItemDetailEntityToState(Left(ServerFailure()), context));
    }
  }

  addToCart(bool isInCart) {
    isInCart = !isInCart;
    return isInCart;
    // emit(ItemDetailRefreshState());
  }

  ///***helpers
  ItemDetailState _mapFailureOrItemDetailEntityToState(
      Either<Failure, ItemDetailEntity> either, BuildContext context) {
    return either.fold(
      (failure) => ItemDetailErrorState(
        status: _mapFailureToMessage(
          failure,
          context,
        ),
      ),
      (itemDetailEntity) =>
          ItemDetailSuccessState(itemDetailEntity: itemDetailEntity),
    );
  }

  ///***helpers ItemVariation

  ///***helpers ItemVariation End

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
