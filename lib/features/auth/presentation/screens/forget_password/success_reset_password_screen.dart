import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/constants/app_routes_name.dart';
import 'package:mini_ecommerce/core/custom_widgets/custom_button.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';
import 'package:mini_ecommerce/features/auth/presentation/widgets/custom_auth_txtBody.dart';

class SuccessResetPassScreen extends StatelessWidget {
  const SuccessResetPassScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kShapesColor,
        title: Text("success_reset_title".tr(context)),
      ),
      body: Center(
        child: SizedBox(
          height: screenHeight * 0.9,
          width: screenWidth * 0.75,
          child: LayoutBuilder(builder: (context, constraint) {
            final double maxHeight = constraint.maxHeight;
            final double maxWidth = constraint.maxWidth;
            return Column(
              children: [
                Icon(
                  Icons.check_circle_outline,
                  size: maxWidth * 0.5,
                  color: AppColors.kShapesColor,
                ),
                SizedBox(
                  height: maxWidth * 0.05,
                ),
                CustomAuthTxtBody(
                    height: maxHeight * 0.15,
                    bodyTxt: 'success_reset_body'.tr(context),
                    fontSize: 20),
                const Spacer(
                  flex: 1,
                ),
                CustomButton(
                  text: 'go_to_login'.tr(context),
                  height: constraint.maxHeight * 0.07,
                  width: constraint.maxWidth * 0.8,
                  onTap: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, AppRoutesName.login, (route) => false);
                  },
                ),
                const Spacer(
                  flex: 1,
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
