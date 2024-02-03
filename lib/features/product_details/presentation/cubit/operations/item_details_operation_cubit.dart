import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';
import 'package:mini_ecommerce/features/product_details/domain/entities/item_detail_operation_entity.dart';
import 'package:mini_ecommerce/features/product_details/domain/use_cases/add_to_cart_use_case.dart';
import 'package:mini_ecommerce/features/product_details/domain/use_cases/add_to_favorite_use_case.dart';
import 'package:mini_ecommerce/features/product_details/domain/use_cases/delet_from_cart_use_case.dart';
import 'package:mini_ecommerce/features/product_details/domain/use_cases/delete_from_favorite_use_case.dart';

part 'item_details_operation_state.dart';

class ItemDetailsOperationCubit extends Cubit<ItemDetailsOperationState> {
  ItemDetailsOperationCubit(
      {required this.addToFavoriteUseCase,
      required this.deleteFromFavoriteUseCase,
      required this.deleteFromCartUseCase,
      required this.addToCartUseCase})
      : super(ItemDetailsOperationInitialState());
  final AddToCartUseCase addToCartUseCase;
  final DeleteFromCartUseCase deleteFromCartUseCase;
  final AddToFavoriteUseCase addToFavoriteUseCase;
  final DeleteFromFavoriteUseCase deleteFromFavoriteUseCase;

  ///add to Cart
  Future<bool> addToCart(
      bool isInCart, String userId, String itemId, BuildContext context) async {
    try {
      var result = await addToCartUseCase(userId, itemId);
      isInCart = !isInCart;
      print("cubit--> $result");
      emit(_mapFailureOrItemDetailEntityToState(result, context));
      return isInCart;
    } catch (e) {
      emit(
          _mapFailureOrItemDetailEntityToState(Left(ServerFailure()), context));
    }
    return isInCart;
  }

  ///delete from Cart

  Future<bool> deleteFromCart(
      bool isInCart, String userId, String itemId, BuildContext context) async {
    try {
      var result = await deleteFromCartUseCase(userId, itemId);
      isInCart = !isInCart;
      print("cubit--> $result");
      emit(_mapFailureOrItemDetailEntityToState(result, context));
      return isInCart;
    } catch (e) {
      emit(
          _mapFailureOrItemDetailEntityToState(Left(ServerFailure()), context));
    }
    return isInCart;
  }

  ///add to Favorite

  Future<bool> addToFavorite(
      bool isInFav, int userId, int itemId, BuildContext context) async {
    try {
      var result = await addToFavoriteUseCase(userId, itemId);
      isInFav = !isInFav;
      print("cubit--> $result");
      emit(_mapFailureOrItemDetailEntityToState(result, context));
      return isInFav;
    } catch (e) {
      emit(
          _mapFailureOrItemDetailEntityToState(Left(ServerFailure()), context));
    }
    return isInFav;
  }

  ///delete from Favorite
  Future<bool> deleteFromFavorite(
      bool isInFav, int userId, int itemId, BuildContext context) async {
    try {
      var result = await deleteFromFavoriteUseCase(userId, itemId);
      isInFav = !isInFav;
      print("cubit--> $result");
      emit(_mapFailureOrItemDetailEntityToState(result, context));
      return isInFav;
    } catch (e) {
      emit(
          _mapFailureOrItemDetailEntityToState(Left(ServerFailure()), context));
    }
    return isInFav;
  }

  ///***helpers
  ItemDetailsOperationState _mapFailureOrItemDetailEntityToState(
      Either<Failure, ItemDetailOperationEntity> either, BuildContext context) {
    return either.fold(
      (failure) => ItemDetailsOperationErrorState(
        status: _mapFailureToMessage(
          failure,
          context,
        ),
      ),
      (itemDetailEntity) => ItemDetailsOperationSuccessState(),
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
