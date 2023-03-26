import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenRepository{
  static const KEY = "splashScreen";
  saveSplashScreen(bool value) async {
    SharedPreferences sharedPreferences = await
    SharedPreferences.getInstance();
    sharedPreferences.setBool(KEY, value);
  }

  Future<bool> getSplashScreen() async {
    SharedPreferences sharedPreferences = await
    SharedPreferences.getInstance();
    return sharedPreferences.getBool(KEY) ?? true;
  }
}