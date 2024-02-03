import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/error/failures.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';
import 'package:mini_ecommerce/features/auth/domain/entities/auth_entity.dart';
import 'package:mini_ecommerce/features/auth/domain/use_cases/login_usecase.dart';
import 'package:mini_ecommerce/features/auth/domain/use_cases/signup_usecase.dart';
import 'package:mini_ecommerce/features/auth/domain/use_cases/verify_code_usecase.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(
      {required this.verifyCodeUseCase,
      required this.signupUseCase,
      required this.loginUseCase})
      : super(AuthInitialState());
  final LoginUseCase loginUseCase;
  final SignupUseCase signupUseCase;
  final VerifyCodeUseCase verifyCodeUseCase;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  Future<void> close() {
    userNameController.dispose();
    passwordController.dispose();
    emailController.dispose();
    phoneController.dispose();
    super.close();
    return Future.value();
  }

  login(BuildContext context) async {
    if (formState.currentState!.validate()) {
      try {
        emit(AuthLoadingState());
        var result = await loginUseCase(
            userEmail: emailController.text,
            userPassword: passwordController.text);
        print(result);

        emit(_mapFailureOrAuthEntityToState(result, context));
      } catch (e) {
        print(e.toString());

        emit(_mapFailureOrAuthEntityToState(Left(ServerFailure()), context));
      }
    } else {
      debugPrint("Not Valid");
    }
  }

  signup(BuildContext context) async {
    if (formState.currentState!.validate()) {
      try {
        emit(AuthLoadingState());
        var result = await signupUseCase(
            userEmail: emailController.text,
            userName: userNameController.text,
            phoneNumber: phoneController.text,
            userPassword: passwordController.text);
        print(result);
        emit(_mapFailureOrAuthEntityToState(result, context));
      } catch (e) {
        print(e.toString());

        emit(_mapFailureOrAuthEntityToState(Left(ServerFailure()), context));
      }
    } else {
      print("Not Valid");
    }
  }

  verifyCode(
      String email, String verificationCode, BuildContext context) async {
    try {
      emit(AuthLoadingState());
      var result = await verifyCodeUseCase(email, verificationCode);
      print(" cubit=> $result");

      emit(_mapFailureOrAuthEntityToState(result, context));
    } catch (e) {
      print(e.toString());
      emit(_mapFailureOrAuthEntityToState(Left(ServerFailure()), context));
    }
  }

  ///***helpers

  AuthState _mapFailureOrAuthEntityToState(
      Either<Failure, AuthEntity> either, BuildContext context) {
    return either.fold(
      (failure) => AuthErrorState(
        status: _mapFailureToMessage(
          failure,
          context,
        ),
      ),
      (auth) => AuthSuccessState(authEntity: auth),
    );
  }

  String _mapFailureToMessage(Failure failure, BuildContext context) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return "serverFailure".tr(context);
      case OfflineFailure:
        return "offlineFailure".tr(context);
      case EmailExistFailure:
        return "emailExist".tr(context);
      case VerificationCodeFailure:
        return "verificationCodeFailure".tr(context);
      case VerificationCodeUsedBeforeFailure:
        return "verifiedHadBeenUsedBefore".tr(context);

      case EmailFailure:
        return "emailFailure".tr(context);
      case NotFoundFailure:
        return "notFoundFailure".tr(context);
      case NotAcceptableAccountFailure:
        return "unAcceptableFailure".tr(context);
      default:
        return "unExpectedFailure".tr(context);
    }
  }
}
