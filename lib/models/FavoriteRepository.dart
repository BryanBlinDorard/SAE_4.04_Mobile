import 'package:shared_preferences/shared_preferences.dart';

class FavoriteRepository{
  static const KEY = "favoris";
  saveFavoris(List<int> value) async {
    SharedPreferences sharedPreferences = await
    SharedPreferences.getInstance();
    sharedPreferences.setStringList(KEY, value.map((e) => e.toString()).toList());
  }

  Future<List<int>> getFavoris() async {
    SharedPreferences sharedPreferences = await
    SharedPreferences.getInstance();
    return sharedPreferences.getStringList(KEY)?.map((e) => int.parse(e))?.toList() ?? [];
  }
}
