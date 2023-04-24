import 'package:base_structure_project/const_values/assets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreference {
  static SharedPreferences? sharedPreferences;

  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static void setHeroImage(String heroImage) async {
    await sharedPreferences!.setString('heroImage', heroImage);
  }

  static String? getHeroImage() {
    return sharedPreferences!.getString('heroImage') == null
        ? Assets.defaultHero
        : sharedPreferences!.getString('heroImage')!.isEmpty
            ? Assets.defaultHero
            : sharedPreferences!.getString('heroImage');
  }

  static void setToken(String token) async {
    await sharedPreferences!.setString('token', token);
  }

  static String getToken() {
    return sharedPreferences!.getString('token') ?? '';
  }

  /// [setLoginState] is for when we want to login to the account
  /// we set this boolean true for when we open the app
  /// and check this boolean if it is true it means you should
  /// go to the mainView but if it is false you should login first
  static void setLoginState(bool loginState) async {
    await sharedPreferences!.setBool('login', loginState);
  }

  static bool isLoggedIn() {
    return sharedPreferences!.getBool('login') ?? false;
  }

  static void setHasOnBoardingPage(bool hasOnBoardingPage) async {
    await sharedPreferences!.setBool('hasOnBoardingPage', hasOnBoardingPage);
  }

  static bool hasOnBoardingPage() {
    return sharedPreferences!.getBool('hasOnBoardingPage') ?? true;
  }

  /// in [logout] some datas are going to be empty or null,
  /// it depends on your need
  static void logout() async {
    setLoginState(false);
    setToken('');
    setHeroImage('');
  }
}
