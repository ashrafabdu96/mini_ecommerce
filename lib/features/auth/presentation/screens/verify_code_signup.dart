import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:mini_ecommerce/core/app_theme.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/constants/app_routes_name.dart';
import 'package:mini_ecommerce/core/custom_widgets/back_ground_widget.dart';
import 'package:mini_ecommerce/core/custom_widgets/snack_bar_message.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';
import 'package:mini_ecommerce/features/auth/presentation/cubit/authentication/auth_cubit.dart';
import 'package:mini_ecommerce/features/auth/presentation/widgets/custom_auth_text_title.dart';
import 'package:mini_ecommerce/features/auth/presentation/widgets/custom_auth_txtBody.dart';
import 'package:mini_ecommerce/injection_container.dart';

class VerifyCodeSignUpScreen extends StatelessWidget {
  const VerifyCodeSignUpScreen({Key? key, required this.email})
      : super(key: key);
  final String email;
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    print("email===>$email");
    // var arg = ModalRoute.of(context)!.profile_f.arguments;
    // print(arg.toString());
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      body: BackGroundWidget(
        child: SizedBox(
          height: screenHeight * 0.9,
          width: screenWidth,
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: AppColors.grey.withOpacity(0.6),
            ),
            child: BlocProvider(
              create: (context) => sl<AuthCubit>(),
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
                        child: Column(
                          children: [
                            SizedBox(
                              height: screenHeight * 0.09,
                            ),
                            CustomAuthTxtTitle(
                              height: constraint.maxHeight * 0.08,
                              title: "verify_code_title".tr(context),
                              fontSize: 24,
                            ),
                            SizedBox(
                              height: constraint.maxHeight * 0.05,
                            ),
                            CustomAuthTxtBody(
                              fontSize: constraint.maxWidth * 0.04,
                              height: constraint.maxHeight * 0.1,
                              bodyTxt: "verify_code_body".tr(context),
                            ),

                            ///***** email
                            SizedBox(
                              height: screenHeight * 0.02,
                            ),

                            ///*******otp

                            BlocConsumer<AuthCubit, AuthState>(
                              listener: (context, state) {
                                if (state is AuthSuccessState) {
                                  Navigator.of(context).pushNamedAndRemoveUntil(
                                    AppRoutesName.successSignup,
                                    (route) => false,
                                  );
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
                                  return OtpTextField(
                                    numberOfFields: 5,
                                    borderColor: AppColors.kShapesColor,
                                    enabledBorderColor: AppColors.kShapesColor,
                                    borderWidth: constraint.minWidth * 0.01,
                                    borderRadius: BorderRadius.circular(20),
                                    cursorColor: Colors.black,
                                    //set to true to show as box or false to show as dash
                                    showFieldAsBox: true,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,

                                    autoFocus: true,
                                    fillColor: AppColors.grey,
                                    textStyle: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18,
                                    ),
                                    filled: true,
                                    showCursor: true,
                                    //runs when a code is typed in
                                    onCodeChanged: (String code) {
                                      //handle validation or checks here
                                    },
                                    //runs when every textfield is filled
                                    onSubmit: (String verificationCode) {
                                      BlocProvider.of<AuthCubit>(context)
                                          .verifyCode(
                                              email, verificationCode, context);
                                    }, // end onSubmit
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    enabled: true,
                                    keyboardType: TextInputType.number,
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
    );
  }
}

// LayoutBuilder(
// builder: (context, constraint) {
// return Column(
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
// SizedBox(
// height: constraint.maxHeight * 0.1,
// ),
// //Verification title
// CustomAuthTxtTitle(
// title: "verify_code_title".tr(context),
// height: constraint.maxHeight * 0.14,
// fontSize: 18,
// ),
// SizedBox(
// height: constraint.maxHeight * 0.02,
// ),
// //enter Verification code
// CustomAuthTxtBody(
// height: constraint.maxHeight * 0.15,
// bodyTxt: 'verify_code_body'.tr(context),
// fontSize: 20,
// ),
// SizedBox(
// height: constraint.maxHeight * 0.05,
// ),
//
// //verify code otp
// OtpTextField(
// numberOfFields: 5,
// borderColor: AppColors.kShapesColor,
// enabledBorderColor: AppColors.kShapesColor,
// borderWidth: constraint.minWidth * 0.01,
// borderRadius: BorderRadius.circular(20),
// cursorColor: Colors.green,
// //set to true to show as box or false to show as dash
// showFieldAsBox: true,
// //runs when a code is typed in
// onCodeChanged: (String code) {
// //handle validation or checks here
// },
// //runs when every textfield is filled
// onSubmit: (String verificationCode) {
// // controller.checkCode(verificationCode);
// }, // end onSubmit
// ),
//
// SizedBox(
// height: constraint.maxHeight * 0.05,
// ),
// // CustomButton(
// //   text: '21'.tr,
// //   height: 0.065,
// //   width: 0.6,
// //   constraint: constraint,
// //   onTap: () {
// //     verifyController.goToResetPassword();
// //   },
// // ),
// SizedBox(
// height: constraint.maxHeight * 0.04,
// ),
// ],
// );
// },
// ),
