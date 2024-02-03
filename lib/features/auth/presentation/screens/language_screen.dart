import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/app_theme.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/custom_widgets/back_ground_widget.dart';
import 'package:mini_ecommerce/core/custom_widgets/custom_button.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';
import 'package:mini_ecommerce/features/auth/presentation/cubit/local/locale_cubit.dart';
import 'package:mini_ecommerce/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/app_routes_name.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        body: BackGroundWidget(
      child: Center(
        child: Container(
          color: AppColors.grey.withOpacity(0.6),
          child: Container(
            height: screenHeight * 0.7,
            width: screenWidth * 0.8,
            decoration: boxDecorationBorderStyle,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "choose_Lang".tr(context),
                  style: const TextStyle(
                    color: AppColors.kBlackFonts,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.04,
                ),
                CustomButton(
                  text: 'lang_one'.tr(context),
                  height: screenHeight * 0.05,
                  width: screenWidth * 0.4,
                  onTap: () {
                    sl<SharedPreferences>().setString("lang", "en");
                    BlocProvider.of<LocaleCubit>(context)
                        .changeLanguage('en', isFirstTime: true);
                    Navigator.pushNamed(
                      context,
                      AppRoutesName.login,
                    );
                  },
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                CustomButton(
                    text: "lang_two".tr(context),
                    height: screenHeight * 0.05,
                    width: screenWidth * 0.4,
                    onTap: () {
                      sl<SharedPreferences>().setString("lang", "ar");
                      BlocProvider.of<LocaleCubit>(context).changeLanguage(
                        "ar",
                        isFirstTime: true,
                      );
                      Navigator.pushNamed(
                        context,
                        AppRoutesName.login,
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
