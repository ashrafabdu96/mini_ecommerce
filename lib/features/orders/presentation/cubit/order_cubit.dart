import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';
import 'package:mini_ecommerce/features/orders/domain/entities/order_entity.dart';
import 'package:mini_ecommerce/features/orders/domain/use_cases/get_orders_usecase.dart';

part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  OrderCubit({required this.getOrdersUseCase}) : super(OrderInitialState());
  final GetOrdersUseCase getOrdersUseCase;

  getOrderData({required BuildContext context, required String where}) async {
    try {
      emit(OrderLoadingState());
      var result = await getOrdersUseCase(where: where);
      print("--->>Orders--->>$result");
      emit(_mapFailureOrHeadOrderEntityToState(result, context));
    } catch (e) {
      emit(_mapFailureOrHeadOrderEntityToState(Left(ServerFailure()), context));
    }
  }

  ///helpers
  OrderState _mapFailureOrHeadOrderEntityToState(
      Either<Failure, HeadOrderEntity> either, BuildContext context) {
    return either.fold(
      (failure) {
        return OrderErrorState(status: _mapFailureToMessage(failure, context));
      },
      (entity) {
        return OrderSuccessState(headOrderEntity: entity);
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
