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
import 'package:mini_ecommerce/features/auth/presentation/widgets/custom_auth_text_title.dart';
import 'package:mini_ecommerce/features/auth/presentation/widgets/custom_auth_txtBody.dart';
import 'package:mini_ecommerce/features/auth/presentation/widgets/custom_login_or_signup.dart';
import 'package:mini_ecommerce/features/auth/presentation/widgets/custom_text_form_field.dart';
import 'package:mini_ecommerce/injection_container.dart';

import '../cubit/authentication/auth_cubit.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      // drawer: Drawer(),

      body: SafeArea(
        child: BlocProvider<AuthCubit>(
          create: (context) => sl<AuthCubit>(),
          child: BackGroundWidget(
            child: SizedBox(
              height: screenHeight,
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
                      child: LayoutBuilder(builder: (context, constraint) {
                        return Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: constraint.maxWidth * 0.06,
                          ),
                          child: Form(
                            key: BlocProvider.of<AuthCubit>(context).formState,
                            child: Column(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: screenHeight * 0.05,
                                ),
                                CustomAuthTxtTitle(
                                  height: constraint.maxHeight * 0.08,
                                  title: "signup_title".tr(context),
                                  fontSize: 24,
                                ),
                                CustomAuthTxtBody(
                                  fontSize: constraint.maxWidth * 0.04,
                                  height: constraint.maxHeight * 0.1,
                                  bodyTxt: "signup_body".tr(context),
                                ),

                                ///****phone number
                                SizedBox(
                                  height: screenHeight * 0.02,
                                ),
                                SizedBox(
                                  width: constraint.maxWidth * 0.9,
                                  height: constraint.maxHeight * 0.075,
                                  child: CustomTextFormField(
                                    controller:
                                        BlocProvider.of<AuthCubit>(context)
                                            .phoneController,
                                    suffixIcon: Icons.phone_android_outlined,
                                    hintText: "phone_number".tr(context),
                                    validator: (val) {
                                      return validInput(
                                          val!, 8, 25, "phone_number", context);
                                    },
                                    labelText: "phone_number".tr(context),
                                  ),
                                ),

                                ///****user name
                                SizedBox(
                                  height: screenHeight * 0.02,
                                ),
                                SizedBox(
                                  width: constraint.maxWidth * 0.9,
                                  height: constraint.maxHeight * 0.075,
                                  child: CustomTextFormField(
                                    controller:
                                        BlocProvider.of<AuthCubit>(context)
                                            .userNameController,
                                    validator: (val) {
                                      return validInput(
                                          val!, 8, 25, "userName", context);
                                    },
                                    suffixIcon: Icons.person_outline,
                                    hintText: "user_name".tr(context),
                                    labelText: "user_name".tr(context),
                                  ),
                                ),

                                ///******email
                                SizedBox(
                                  height: screenHeight * 0.02,
                                ),
                                SizedBox(
                                  width: constraint.maxWidth * 0.9,
                                  height: constraint.maxHeight * 0.075,
                                  child: CustomTextFormField(
                                    controller:
                                        BlocProvider.of<AuthCubit>(context)
                                            .emailController,
                                    suffixIcon: Icons.email_outlined,
                                    validator: (val) {
                                      return validInput(
                                          val!, 8, 80, "email", context);
                                    },
                                    hintText: "email".tr(context),
                                    labelText: "email".tr(context),
                                  ),
                                ),

                                ///****password
                                SizedBox(
                                  height: screenHeight * 0.02,
                                ),
                                SizedBox(
                                  width: constraint.maxWidth * 0.9,
                                  height: constraint.maxHeight * 0.075,
                                  child: CustomTextFormField(
                                    validator: (val) {
                                      return validInput(
                                          val!, 8, 25, "password", context);
                                    },
                                    controller:
                                        BlocProvider.of<AuthCubit>(context)
                                            .passwordController,
                                    suffixIcon: Icons.visibility_outlined,
                                    hintText: "password".tr(context),
                                    labelText: "password".tr(context),
                                  ),
                                ),

                                ///*****CustomLogOrSignText
                                SizedBox(
                                  height: screenHeight * 0.02,
                                ),
                                CustomLogOrSignText(
                                  height: constraint.maxHeight * 0.05,
                                  width: constraint.maxWidth,
                                  textOne: "have_account".tr(context),
                                  textTwo: "login_title".tr(context),
                                  onTap: () {
                                    Navigator.of(context)
                                        .pushNamed(AppRoutesName.login);
                                  },
                                  widthSpace: constraint.maxWidth * 0.03,
                                ),
                                SizedBox(
                                  height: screenHeight * 0.02,
                                ),
                                BlocConsumer<AuthCubit, AuthState>(
                                  listener: (context, state) {
                                    if (state is AuthSuccessState) {
                                      Navigator.pushNamedAndRemoveUntil(
                                          context,
                                          AppRoutesName.verifyCodeSignup,
                                          arguments: state.authEntity.userEmail,
                                          (route) => false);
                                    } else if (state is AuthErrorState) {
                                      showSnackMessage(
                                        context: context,
                                        message: state.status,
                                        textColor: AppColors.white,
                                        bkgColor: AppColors.kShapesColor,
                                      );
                                    }
                                  },
                                  builder: (context, state) {
                                    if (state is AuthLoadingState) {
                                      return CircularProgressIndicator(
                                        strokeWidth: constraint.maxWidth * 0.02,
                                      );
                                    } else {
                                      return CustomButton(
                                        text: "signup_title".tr(context),
                                        height: constraint.maxHeight * 0.06,
                                        width: constraint.maxWidth * 0.6,
                                        onTap: () {
                                          BlocProvider.of<AuthCubit>(context)
                                              .signup(context);
                                          // Navigator.pushNamedAndRemoveUntil(
                                          //   context,
                                          //   AppRoutesName.verifyCodeSignup,
                                          //   arguments: BlocProvider.of<AuthCubit>(
                                          //           context)
                                          //       .emailController
                                          //       .text,
                                          //   (route) => false
                                          // );
                                        },
                                      );
                                    }
                                  },
                                )
                              ],
                            ),
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
