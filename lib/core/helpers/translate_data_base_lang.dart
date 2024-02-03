import 'package:mini_ecommerce/injection_container.dart';
import 'package:shared_preferences/shared_preferences.dart';

translateDataBaseLang(String ar, String en) {
  final lang = sl<SharedPreferences>();
  if (lang.getString("lang") == "ar") {
    return ar;
  } else {
    return en;
  }
}
