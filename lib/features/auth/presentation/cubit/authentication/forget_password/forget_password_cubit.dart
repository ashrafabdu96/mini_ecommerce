import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';
import 'package:mini_ecommerce/features/auth/domain/entities/auth_entity.dart';
import 'package:mini_ecommerce/features/auth/domain/use_cases/change_password_usecase.dart';
import 'package:mini_ecommerce/features/auth/domain/use_cases/forget_password_usecase.dart';
import 'package:mini_ecommerce/features/auth/domain/use_cases/forget_password_verify_usecase.dart';
import 'package:mini_ecommerce/features/auth/domain/use_cases/reset_password_usecase.dart';

part 'forget_password_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  ForgetPasswordCubit(
      {required this.changePasswordUseCase,
      required this.forgetPasswordVerifyCodeUseCase,
      required this.forgetPasswordUseCase,
      required this.resetPasswordUseCase})
      : super(ForgetPasswordInitialState());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  ForgetPasswordUseCase forgetPasswordUseCase;
  ResetPasswordUseCase resetPasswordUseCase;
  final ForgetPasswordVerifyCodeUseCase forgetPasswordVerifyCodeUseCase;
  final ChangePasswordUseCase changePasswordUseCase;
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  forgetPasswordCheckEmail(BuildContext context) async {
    if (formState.currentState!.validate()) {
      try {
        emit(ForgetPasswordLoadingState());
        final Either<Failure, AuthEntity> result =
            await forgetPasswordUseCase(emailController.text);
        debugPrint(" cuuuuuubit=> $result");

        emit(_mapFailureOrAuthEntityToState(result, context));
      } catch (e) {
        // print(e.toString());
        emit(_mapFailureOrAuthEntityToState(Left(ServerFailure()), context));
      }
    } else {
      print('not valid');
    }
    return Future.value();
  }

  resetPassword(String email, BuildContext context) async {
    if (formState.currentState!.validate()) {
      if (passwordController.text != rePasswordController.text) {
        emit(_mapFailureOrAuthEntityToState(
            Left(UnAcceptableFailure()), context));
      } else {
        try {
          emit(ForgetPasswordLoadingState());
          final Either<Failure, AuthEntity> result = await resetPasswordUseCase(
              email: email, password: passwordController.text);
          print(" cuuuuuubit=> $result");
          emit(_mapFailureOrAuthEntityToState(result, context));
        } catch (e) {
          // print(e.toString());
          emit(_mapFailureOrAuthEntityToState(Left(ServerFailure()), context));
        }
      }
    } else {
      print('not valid');
    }
  }

  changePassword({required String email, required BuildContext context}) async {
    if (formState.currentState!.validate()) {
      try {
        emit(ForgetPasswordLoadingState());
        final Either<Failure, AuthEntity> result = await changePasswordUseCase(
          email: email,
          oldPassword: passwordController.text,
          newPassword: rePasswordController.text,
        );
        print(" cuuuuuubit=> $result");
        emit(_mapFailureOrAuthEntityToState(result, context));
      } catch (e) {
        // print(e.toString());
        emit(_mapFailureOrAuthEntityToState(Left(ServerFailure()), context));
      }
    } else {
      print('not valid');
    }
  }

  verifyCodeForgetPassword(
      String email, String verificationCode, BuildContext context) async {
    try {
      emit(ForgetPasswordLoadingState());
      final result =
          await forgetPasswordVerifyCodeUseCase(email, verificationCode);
      print(" cuuuuuubit=> $result");
      if (context.mounted) {
        emit(_mapFailureOrAuthEntityToState(result, context));
      }
    } catch (e) {
      debugPrint(e.toString());
      if (context.mounted) {
        emit(_mapFailureOrAuthEntityToState(Left(ServerFailure()), context));
      }
    }
  }

  ///***helpers
  ForgetPasswordState _mapFailureOrAuthEntityToState(
      Either<Failure, AuthEntity> either, BuildContext context) {
    return either.fold(
      (failure) => ForgetPasswordErrorState(
        status: _mapFailureToMessage(
          failure,
          context,
        ),
      ),
      (auth) => ForgetPasswordSuccessState(authEntity: auth),
    );
  }

  String _mapFailureToMessage(Failure failure, BuildContext context) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "serverFailure".tr(context);
      case OfflineFailure:
        return "offlineFailure".tr(context);
      case VerificationCodeFailure:
        return "verificationCodeFailure".tr(context);
      case VerificationCodeUsedBeforeFailure:
        return "verifiedHadBeenUsedBefore".tr(context);
      case NotFoundFailure:
        return "notFoundFailure".tr(context);
      case PasswordFailure:
        return "resetPasswordFailure".tr(context);
      case OldPasswordFailure:
        return "oldPasswordFailure".tr(context);
      case UnAcceptableFailure:
        return "resetFieldsFailure".tr(context);
      default:
        return "unExpectedFailure".tr(context);
    }
  }
}
