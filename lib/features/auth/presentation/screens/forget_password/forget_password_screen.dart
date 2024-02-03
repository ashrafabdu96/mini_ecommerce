import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/app_theme.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/constants/app_routes_name.dart';
import 'package:mini_ecommerce/core/custom_widgets/back_ground_widget.dart';
import 'package:mini_ecommerce/core/custom_widgets/custom_button.dart';
import 'package:mini_ecommerce/core/custom_widgets/snack_bar_message.dart';
import 'package:mini_ecommerce/core/helpers/valid_input.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';
import 'package:mini_ecommerce/features/auth/presentation/cubit/authentication/forget_password/forget_password_cubit.dart';
import 'package:mini_ecommerce/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:mini_ecommerce/injection_container.dart' as di;

import '../../widgets/custom_auth_text_title.dart';
import '../../widgets/custom_auth_txtBody.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: BackGroundWidget(
          child: SizedBox(
            height: screenHeight * 0.9,
            width: screenWidth,
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: AppColors.grey.withOpacity(0.6),
              ),
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.05),
                child: SizedBox(
                  height: screenHeight * 0.8,
                  width: screenWidth * 0.8,
                  child: DecoratedBox(
                    decoration: boxDecorationBorderStyle,
                    child: BlocProvider(
                      create: (context) => di.sl<ForgetPasswordCubit>(),
                      child: LayoutBuilder(builder: (context, constraint) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: constraint.maxWidth * 0.06,
                          ),
                          child: Column(
                            children: [
                              SizedBox(
                                height: screenHeight * 0.09,
                              ),
                              CustomAuthTxtTitle(
                                height: constraint.maxHeight * 0.08,
                                title: "forget_paas".tr(context),
                                fontSize: 24,
                              ),
                              SizedBox(
                                height: constraint.maxHeight * 0.05,
                              ),
                              CustomAuthTxtBody(
                                fontSize: constraint.maxWidth * 0.04,
                                height: constraint.maxHeight * 0.1,
                                bodyTxt: "forget_title".tr(context),
                              ),

                              ///***** email
                              SizedBox(
                                height: screenHeight * 0.02,
                              ),
                              Form(
                                key: BlocProvider.of<ForgetPasswordCubit>(
                                        context)
                                    .formState,
                                child: SizedBox(
                                  width: constraint.maxWidth * 0.9,
                                  height: constraint.maxHeight * 0.075,
                                  child: CustomTextFormField(
                                    validator: (value) {
                                      return validInput(
                                          value!, 15, 50, 'email', context);
                                    },
                                    controller:
                                        BlocProvider.of<ForgetPasswordCubit>(
                                                context)
                                            .emailController,
                                    suffixIcon: Icons.email_outlined,
                                    hintText: "email".tr(context),
                                    labelText: "email".tr(context),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: screenHeight * 0.02,
                              ),
                              BlocConsumer<ForgetPasswordCubit,
                                  ForgetPasswordState>(
                                listener: (context, state) {
                                  if (state is ForgetPasswordSuccessState) {
                                    Navigator.pushNamedAndRemoveUntil(
                                      context,
                                      AppRoutesName.verifyCode,
                                      (route) => false,
                                      arguments: state.authEntity.userEmail,
                                    );
                                  } else if (state
                                      is ForgetPasswordErrorState) {
                                    showSnackMessage(
                                      context: context,
                                      message: state.status,
                                      textColor: AppColors.white,
                                      bkgColor: AppColors.kShapesColor,
                                    );
                                  }
                                },
                                builder: (context, state) {
                                  if (state is ForgetPasswordLoadingState) {
                                    return CircularProgressIndicator(
                                      strokeWidth: constraint.maxWidth * 0.02,
                                    );
                                  } else {
                                    return CustomButton(
                                      text: "check".tr(context),
                                      height: constraint.maxHeight * 0.06,
                                      width: constraint.maxWidth * 0.6,
                                      onTap: () {
                                        BlocProvider.of<ForgetPasswordCubit>(
                                                context)
                                            .forgetPasswordCheckEmail(context);
                                      },
                                    );
                                  }
                                },
                              ),
                              SizedBox(
                                height: screenHeight * 0.02,
                              ),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
