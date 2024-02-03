import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';
import 'package:mini_ecommerce/features/payment/domain/entities/address_entities/address_entity.dart';
import 'package:mini_ecommerce/features/payment/domain/use_cases/add_address_pay_usecase.dart';
import 'package:mini_ecommerce/features/payment/domain/use_cases/get_address_usecase.dart';
import 'package:mini_ecommerce/features/payment/domain/use_cases/update_address_pay_usecase.dart';
import 'package:mini_ecommerce/injection_container.dart';

part 'payment_address_state.dart';

class PaymentAddressCubit extends Cubit<PaymentAddressState> {
  final GetAddressUseCase getAddressUseCase;
  final UpdateAddressPayUseCase updateAddressPayUseCase;
  final AddAddressPayUseCase addAddressPayUseCase;
  AddressEntity? addressEntity;
  int currIndex = 0;
  PaymentAddressCubit({
    required this.updateAddressPayUseCase,
    required this.addAddressPayUseCase,
    required this.getAddressUseCase,
  }) : super(PaymentAddressInitialState());
  getAddress(BuildContext context) async {
    try {
      emit(PaymentAddressLoadingState());
      var result = await getAddressUseCase(userId: int.parse(getUserId()));
      // print('from cubit -->>>$result');
      emit(_mapFailureOrUserAddressEntityToState(result, context));
    } catch (e) {
      emit(_mapFailureOrUserAddressEntityToState(
          Left(ServerFailure()), context));
    }
  }

  addUserAddress(
      {required BuildContext context,
      required AddressEntity addressEntity}) async {
    try {
      final result = await addAddressPayUseCase(addressEntity: addressEntity);
      emit(_mapFailureOrUnitToState(result, context));
    } catch (e) {
      print(e.toString());
      // emit(_mapFailureOrUnitToState(, context));

    }
  }

  updateUserAddress({
    required AddressEntity addressEntity,
    required BuildContext context,
  }) async {
    try {
      final result =
          await updateAddressPayUseCase(addressEntity: addressEntity);
      emit(_mapFailureOrUnitToState(result, context));
    } catch (e) {
      print(e.toString());
      // emit(_mapFailureOrUnitToState(, context));

    }
  }

  //add or update helper
  PaymentAddressState _mapFailureOrUnitToState(
      Either<Failure, Unit> either, BuildContext context) {
    return either.fold(
      (failure) {
        return PaymentAddOrUpdateAddressFailState(
            // status: _mapFailureToMessage(failure, context),
            );
      },
      (unit) {
        return PaymentAddOrUpdateAddressSuccessState();
      },
    );
  }

  ///helpers
  PaymentAddressState _mapFailureOrUserAddressEntityToState(
      Either<Failure, dynamic> either, BuildContext context) {
    return either.fold(
      (failure) {
        return PaymentAddressErrorState(
            status: _mapFailureToMessage(failure, context));
      },
      (entity) {
        addressEntity = entity;
        return PaymentAddressSuccessState(addressEntity: entity);
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
