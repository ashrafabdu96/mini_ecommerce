import 'package:flutter/material.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/constants/app_routes_name.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';
import 'package:mini_ecommerce/features/auth/presentation/screens/forget_password/reset_password_screen.dart';
import 'package:mini_ecommerce/injection_container.dart';

class AccountSettings extends StatelessWidget {
  const AccountSettings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.all(size.height * 0.01),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: size.height * 0.09,
            width: size.width,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                  // color: AppColors.kShapesColor,
                  ),
              child: Text(
                "account_settings".tr(context),
                style: Theme.of(context).textTheme.headline1!.copyWith(
                      color: AppColors.kShapesColor,
                    ),
              ),
            ),
          ),
          // change Password
          AccountSettingsItem(
            size: size,
            title: "change_password".tr(context),
            onTap: () {
              Navigator.pop(context);
              showModalBottomSheet(
                  context: context,
                  builder: (context) {
                    return ResetPasswordScreen(
                      isChange: true,
                      email: getUserEmail(),
                    );
                  });
            },
          ),
          //Forget Password
          AccountSettingsItem(
            size: size,
            title: "forget_password2".tr(context),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(
                context,
                AppRoutesName.forgetPassword,
              );
            },
          ),
          AccountSettingsItem(
            size: size,
            title: "delete_account".tr(context),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(
            height: size.height * 0.05,
          ),
        ],
      ),
    );
  }
}

class AccountSettingsItem extends StatelessWidget {
  const AccountSettingsItem({
    Key? key,
    required this.size,
    this.onTap,
    required this.title,
  }) : super(key: key);

  final Size size;
  final void Function()? onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: ListTile(
            trailing: const Icon(
              Icons.arrow_forward_ios_outlined,
              color: AppColors.kShapesColor,
            ),
            title: Text(
              title,
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontSize: size.width * 0.03,
                    fontWeight: FontWeight.w700,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
