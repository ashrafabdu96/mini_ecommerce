import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';
import 'package:mini_ecommerce/features/auth/data/data_sources/auth_local_data_source.dart';
import 'package:mini_ecommerce/features/user_profile/domain/entities/user_entity.dart';
import 'package:mini_ecommerce/features/user_profile/domain/use_cases/get_user_image_usecase.dart';
import 'package:mini_ecommerce/features/user_profile/domain/use_cases/get_user_info_usecase.dart';
import 'package:mini_ecommerce/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit(
      {required this.getUserImageUseCase, required this.getUserInfoUseCase})
      : super(ProfileInitialState());
  final GetUserInfoUseCase getUserInfoUseCase;
  final GetUserImageUseCase getUserImageUseCase;

  UserEntity? userInfo;
  AuthLocalDataSourceImp authLocalDataSourceImp =
      AuthLocalDataSourceImp(sharedPreferences: sl<SharedPreferences>());

  getUserProfileInfo() async {
    // final result = await getUserImageUseCase(userId: getUserId());
    final UserEntity userEntity = await getUserInfoUseCase();
    emit(ProfileSuccessState(userEntity: userEntity));
  }

  getUserInfoRemotely({required int userId}) async {
    try {
      final result = await getUserImageUseCase(userId: userId);
      emit(_mapFailureOrUserEntityToState(result));
    } catch (e) {
      emit(state);
    }
  }

  ///***helpers
  ProfileState _mapFailureOrUserEntityToState(
    Either<Failure, UserEntity> either,
  ) {
    return either.fold((failure) => ProfileNoImageState(), (userEntity) {
      return ProfileImageChangedState(userEntity: userEntity);
      return ProfileSuccessState(userEntity: userEntity);
    });
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
