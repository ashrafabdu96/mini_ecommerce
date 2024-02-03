import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';
import 'package:mini_ecommerce/features/product_details/domain/entities/item_variation_entity.dart';
import 'package:mini_ecommerce/features/product_details/domain/use_cases/get_item_variation_usecase.dart';

part 'item_variation_state.dart';

class ItemVariationCubit extends Cubit<ItemVariationState> {
  ItemVariationCubit({required this.getItemVariationUseCase})
      : super(ItemVariationInitialState());
  final GetItemVariationUseCase getItemVariationUseCase;

  getVariationData(int itemId, BuildContext context) async {
    try {
      emit(ItemVariationLoadingState());

      var result = await getItemVariationUseCase(itemId);
      print("cubit--> $result");

      emit(_mapFailureOrItemVariationEntityToState(result, context));
      print("cubit--> $result");
    } catch (e) {
      emit(_mapFailureOrItemVariationEntityToState(
          Left(ServerFailure()), context));
    }
  }

  ///***helpers ItemVariation

  ItemVariationState _mapFailureOrItemVariationEntityToState(
      Either<Failure, ItemVariationEntity> either, BuildContext context) {
    return either.fold(
      (failure) => ItemVariationErrorState(
        status: _mapFailureToMessage(
          failure,
          context,
        ),
      ),
      (itemVariationEntity) =>
          ItemVariationSuccessState(itemVariationEntity: itemVariationEntity),
    );
  }

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
