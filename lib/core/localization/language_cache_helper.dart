import 'package:mini_ecommerce/injection_container.dart' as di;
import 'package:shared_preferences/shared_preferences.dart';

class LanguageCacheHelper {
  Future<void> cacheLanguageCode(String langeCode) async {
    di.sl<SharedPreferences>().setString("LOCAL", langeCode);
  }
// var x= Locale()

  Future<String> getCachedLanguageCode() async {
    final cachedLanguageCode = di.sl<SharedPreferences>().getString("LOCAL");
    if (cachedLanguageCode != null) {
      return cachedLanguageCode;
    } else {
      return 'ar';
    }
  }
}
