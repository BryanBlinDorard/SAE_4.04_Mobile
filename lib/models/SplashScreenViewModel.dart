
import 'package:flutter/cupertino.dart';
import 'package:sae_flutter/models/SplashScreenRepository.dart';

class SplashScreenViewModel extends ChangeNotifier {
  late bool _isCoched;
  late SplashScreenRepository _splashScreenRepository;
  bool get isCoched => _isCoched;

  SplashScreenViewModel() {
    _splashScreenRepository = SplashScreenRepository();
    _isCoched = false;
    getSplashScreen();
  }

  void getSplashScreen() async {
    _isCoched = await _splashScreenRepository.getSplashScreen();
    notifyListeners();
  }

  void saveSplashScreen(bool value) async {
    print(value);
    _isCoched = value;
    _splashScreenRepository.saveSplashScreen(value);
    notifyListeners();
  }

  Future<bool> getIsCoched() async {
    return await _splashScreenRepository.getSplashScreen();
  }
}