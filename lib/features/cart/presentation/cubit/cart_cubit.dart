import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';
import 'package:mini_ecommerce/features/cart/domain/entities/cart_entity.dart';
import 'package:mini_ecommerce/features/cart/domain/entities/cart_operation_entity.dart';
import 'package:mini_ecommerce/features/cart/domain/use_cases/delete_cart_usecase.dart';
import 'package:mini_ecommerce/features/cart/domain/use_cases/get_cart_data_usecase.dart';
import 'package:mini_ecommerce/features/cart/domain/use_cases/update_cart_item_quantity_usecase.dart';
import 'package:mini_ecommerce/injection_container.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(
      {required this.updateCartItemQuantityUseCase,
      required this.deleteCartUseCase,
      required this.getCartDataUseCase})
      : super(CartInitialState());
  GetCartDataUseCase getCartDataUseCase;
  UpdateCartItemUseCase updateCartItemQuantityUseCase;
  List<CartDataEntity> cartProductsList = [];
  int itemCount = 1;
  DeleteCartUseCase deleteCartUseCase;
  updateCartItemQuantity({
    required BuildContext context,
    required int itemId,
    required int quantity,
  }) async {
    try {
      // emit(CartOperationLoadingState());
      var result = await updateCartItemQuantityUseCase(quantity, itemId);
      // getCartData(context);
      print('addedd');
      // emit(_mapFailureOrCartOperationEntityToState(result, context));
    } catch (e) {
      print('removed');
      // emit(_mapFailureOrCartOperationEntityToState(
      //     Left(ServerFailure()), context));
    }
  }

  String getTheTotalPriceOFProducts() {
    int total = 0;
    for (int i = 0; i < cartProductsList.length; i++) {
      total = total +
          (cartProductsList[i].itemsPrice!.toInt() *
              cartProductsList[i].cartQuantity!.toInt());
    }

    return total.toString();
  }

  deleteCartData(BuildContext context, String itemId) async {
    try {
      // emit(CartOperationLoadingState());
      var result = await deleteCartUseCase(getUserId(), itemId);
      emit(_mapFailureOrCartOperationEntityToState(result, context));
    } catch (e) {
      emit(_mapFailureOrCartOperationEntityToState(
          Left(ServerFailure()), context));
    }
  }

  getCartData(BuildContext context) async {
    try {
      emit(CartLoadingState());
      var result = await getCartDataUseCase(int.parse(getUserId()));
      // print("--->>--->>$result");
      emit(_mapFailureOrCartEntityToState(result, context));
    } catch (e) {
      emit(_mapFailureOrCartEntityToState(Left(ServerFailure()), context));
    }
  }

  checkProductQuantity(bool isAdd) {
    int count = 0;
    // int countDw = 1;

    if (isAdd) {
      emit(IncrementCartState(quantityIn: itemCount++));
    } else {
      emit(DecrementCartState(quantityDe: itemCount--));
    }
    // itemCount = isAdd ? ++itemCount : --itemCount;
    // emit(CartInitialState());
  }

  ///***helpers
  CartState _mapFailureOrCartEntityToState(
      Either<Failure, CartEntity> either, BuildContext context) {
    return either.fold(
      (failure) => CartErrorState(
        status: _mapFailureToMessage(
          failure,
          context,
        ),
      ),
      (cartEntity) {
        cartProductsList.addAll(cartEntity.cartDataEntity!.toList());
        return CartSuccessState(cartEntity: cartEntity);
      },
    );
  }

  ///helpers
  CartState _mapFailureOrCartOperationEntityToState(
    Either<Failure, CartOperationEntity> either,
    BuildContext context,
  ) {
    return either.fold(
      (failure) => CartDeleteErrorState(
        status: _mapFailureToMessage(
          failure,
          context,
        ),
      ),
      (cartOperationEntity) {
        return CartDeleteSuccessState(cartOperationEntity: cartOperationEntity);
      },
    );
  }

  refresh() {
    // cartProductsList.removeWhere((element) => element.itemsId == index);
  }

  ///operation helper

  ///helpers

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
