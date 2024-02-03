import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mini_ecommerce/core/constants/app_colors.dart';
import 'package:mini_ecommerce/core/constants/app_routes_name.dart';
import 'package:mini_ecommerce/core/localization/app_localizations.dart';
import 'package:mini_ecommerce/features/auth/presentation/cubit/local/locale_cubit.dart';
import 'package:mini_ecommerce/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChangeLanguage extends StatefulWidget {
  const ChangeLanguage({Key? key, required this.size}) : super(key: key);
  final Size size;

  @override
  State<ChangeLanguage> createState() => _ChangeLanguageState();
}

class _ChangeLanguageState extends State<ChangeLanguage> {
  late bool isEnglish;
  bool isChanged = false;
  @override
  void initState() {
    setState(() {
      isEnglish = getLang() == 'ar' ? false : true;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            "change_language".tr(context),
            style: Theme.of(context)
                .textTheme
                .headline1!
                .copyWith(color: AppColors.kShapesColor),
          ),
          Card(
              child: SwitchListTile(
                title: Text(
                  isEnglish ? "العربية" : "English",
                  style: Theme.of(context).textTheme.headline6,
                ),
                onChanged: (val) {
                  setState(() {
                    val = !val;
                  });
                  sl<SharedPreferences>()
                      .setString("lang", isEnglish ? "ar" : "en");
                  BlocProvider.of<LocaleCubit>(context)
                      .changeLanguage(isEnglish ? "ar" : "en", isFirstTime: false);
                  Navigator.pushNamedAndRemoveUntil(
                    context,
                    AppRoutesName.homeScreen,
                    arguments: getUserId(),
                        (route) => false,
                  );
                },
                value: isChanged,
              )),
        ],
      ),
    );
  }
}
