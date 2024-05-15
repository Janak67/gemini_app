import 'package:shared_preferences/shared_preferences.dart';

class ShareHelper {
  static ShareHelper shareHelper = ShareHelper._();

  ShareHelper._();

  Future<void> setTheme(bool isTheme) async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    shr.setBool('theme', isTheme);
  }

  Future<bool?> getTheme() async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    bool? isTheme = shr.getBool('theme');
    return isTheme;
  }

  Future<void> setIntro() async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    shr.setBool('intro', true);
  }

  Future<bool?> getIntro() async {
    SharedPreferences shr = await SharedPreferences.getInstance();
    bool? status = await shr.getBool('intro');
    return status;
  }
}
