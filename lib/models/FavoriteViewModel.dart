import 'package:flutter/cupertino.dart';

import 'FavoriteRepository.dart';

class FavoriteViewModel extends ChangeNotifier {
  late List<int> _favoris;
  late FavoriteRepository _favoriteRepository;
  List<int> get favoris => _favoris;

  FavoriteViewModel() {
    _favoris = [];
    _favoriteRepository = FavoriteRepository();
    getFavoris();
  }

  set favoris(List<int> value) {
    _favoris = value;
    _favoriteRepository.saveFavoris(value);
    notifyListeners();
  }

  Future<List<int>> getFavoris() async {
    _favoris = await _favoriteRepository.getFavoris();
    notifyListeners();
    return _favoris;
  }

  addFavori(int id) {
    _favoris.add(id);
    _favoriteRepository.saveFavoris(_favoris);
    notifyListeners();
  }

  removeFavori(int id) {
    _favoris.remove(id);
    _favoriteRepository.saveFavoris(_favoris);
    notifyListeners();
  }

  bool isFavori(int id) {
    return _favoris.contains(id);
  }

  int get count => _favoris.length;

  void clear() {
    _favoris.clear();
    _favoriteRepository.saveFavoris(_favoris);
    notifyListeners();
  }

  void toggleFavori(int id) {
    if (isFavori(id)) {
      removeFavori(id);
    } else {
      addFavori(id);
    }
  }
}