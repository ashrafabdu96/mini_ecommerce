import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:mini_ecommerce/core/localization/language_cache_helper.dart';
import 'package:mini_ecommerce/injection_container.dart' as di;
import 'package:shared_preferences/shared_preferences.dart';

//
part 'locale_state.dart';
//
// class LocalCubit extends Cubit<LocalState> {
//   LocalCubit() : super(LocalInitialState());
//   Future<void> getSavedLanguage(BuildContext context) async {
//     // final language ;
//     final String cachedLanguageCode =
//         await LanguageCacheHelper().getCachedLanguageCode();
//
//     // print(local.languageCode);
//
//     emit(ChangeLocalState(locale: Locale(cachedLanguageCode)));
//   }
//
//   Future<void> changeLanguage(String langeCode) async {
//     await LanguageCacheHelper().cacheLanguageCode(langeCode);
//     // final String? appStep = di.sl<SharedPreferences>().getString("step");
//     emit(
//       ChangeLocalState(locale: Locale(langeCode)),
//     );
//   }
//
//   Widget goToAuth() {
//     final String? appStep = di.sl<SharedPreferences>().getString("step");
//     switch (appStep) {
//       case "one":
//         return const LoginScreen();
//       // case "two": return const HomeScreen();
//       default:
//         return const LanguageScreen();
//     }
//   }
// }

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(InitialLocalState());

  Future<void> getSavedLanguage() async {
    final String cachedLanguageCode =
        await LanguageCacheHelper().getCachedLanguageCode();
    // final Locale? locale = localeResolutionCallback(null, supportedLocales);
    // print("cubit ${locale!.languageCode}");
    emit(ChangeLocaleState(locale: Locale(cachedLanguageCode)));
  }

  Future<void> changeLanguage(String languageCode,
      {required bool isFirstTime}) async {
    await LanguageCacheHelper().cacheLanguageCode(languageCode);
    isFirstTime ? di.sl<SharedPreferences>().setString("step", "one") : null;
    emit(ChangeLocaleState(locale: Locale(languageCode)));
  }
}
