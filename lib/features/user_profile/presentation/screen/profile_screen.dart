import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/constants/app_routes_name.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';
import 'package:mini_ecommerce/features/user_profile/presentation/screen/account_settings.dart';
import 'package:mini_ecommerce/features/user_profile/presentation/screen/change_language.dart';
import 'package:mini_ecommerce/features/user_profile/presentation/widgets/notification_counter.dart';
import 'package:mini_ecommerce/features/user_profile/presentation/widgets/profile_item.dart';
import 'package:mini_ecommerce/features/user_profile/presentation/widgets/user_profile_info_section.dart';
import 'package:mini_ecommerce/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../cubit/profile_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return BlocProvider(
      create: (context) => sl<ProfileCubit>()..getUserProfileInfo(),
      child: SingleChildScrollView(
        child: Column(
          // shrinkWrap: true,
          children: [
            SizedBox(
              height: size.height * 0.035,
            ),
            UserProfileInfoSection(
              size: size,
            ),
            ...List.generate(
              profileIconItems.length,
              (index) {
                return ProfileItem(
                  height: size.height * 0.07,
                  icon: profileIconItems[index],
                  title: getProfileTitleItems(context)[index],
                  onTap: () {
                    // goToPage(context: context, pageNumber: index);
                    if (index == 0) {
                      Navigator.pushNamed(context, AppRoutesName.orderScreen);
                    } else if (index == 2) {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return const AccountSettings();
                          });
                    } else if (index == 3) {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return ChangeLanguage(
                              size: size,
                            );
                            // return const LanguageScreen(
                            //   isFirstTime: false,
                            // );
                          },
                          backgroundColor: AppColors.grey);
                    } else if (index == 4) {
                      sl<SharedPreferences>().setString('step', 'one');
                      Navigator.pushNamedAndRemoveUntil(
                          context, AppRoutesName.login, (route) => false);
                    }
                  },
                  widget: index == 1
                      ? LayoutBuilder(builder: (context, constraint) {
                          return NotificationCounter(
                            height: constraint.maxHeight * 0.5,
                            width: constraint.maxHeight * 0.35,
                            radius: constraint.maxHeight * 0.1,
                          );
                        })
                      : null,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

goToPage({required int pageNumber, required BuildContext context}) {
  List<String> pageNames = [
    AppRoutesName.orderScreen,
    'notification',
    AppRoutesName.accountSettingsScreen,
  ];
  Navigator.pushNamed(context, pageNames[pageNumber]);
}

List<IconData> profileIconItems = [
  Icons.list_alt_rounded,
  Icons.notifications_outlined,
  Icons.settings,
  Icons.language_outlined,
  Icons.logout_outlined
];
List<String> getProfileTitleItems(BuildContext context) {
  return [
    "My Orders".tr(context),
    "Notifications".tr(context),
    "Account Settings".tr(context),
    "App Language".tr(context),
    "Log Out".tr(context),
  ];
}
