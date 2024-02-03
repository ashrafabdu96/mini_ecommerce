import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';
import 'package:mini_ecommerce/features/orders/domain/entities/order_details_entity.dart';
import 'package:mini_ecommerce/features/orders/domain/use_cases/get_order_details_usecase.dart';

part 'order_details_state.dart';

class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit({required this.getOrderDetailsUseCase})
      : super(OrderDetailsInitialState());
  final GetOrderDetailsUseCase getOrderDetailsUseCase;
  getOrderData({required BuildContext context, required int orderId}) async {
    try {
      emit(OrderDetailsLoadingState());
      var result = await getOrderDetailsUseCase(orderId: orderId);
      print("--->>OrdersDetails--->>$result");
      emit(_mapFailureOrOrderDetailsEntityToState(result, context));
    } catch (e) {
      emit(_mapFailureOrOrderDetailsEntityToState(
          Left(ServerFailure()), context));
    }
  }

  OrderDetailsState _mapFailureOrOrderDetailsEntityToState(
      Either<Failure, OrderDetailsEntity> either, BuildContext context) {
    return either.fold(
      (failure) {
        return OrderDetailsErrorState(
            status: _mapFailureToMessage(failure, context));
      },
      (entity) {
        return OrderDetailsSuccessState(orderDetailsEntity: entity);
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
