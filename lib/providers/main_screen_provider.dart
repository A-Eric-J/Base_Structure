import 'package:flutter/material.dart';

/// [MainScreenProvider] is a provider for changing bottomNavigation screens
class MainScreenProvider extends ChangeNotifier {
  int _bottomNavigationCounter = 0;

  void setBottomNavigationCounter(int num) {
    _bottomNavigationCounter = num;
    notifyListeners();
  }

  int get bottomNavigationCounter => _bottomNavigationCounter;
}
