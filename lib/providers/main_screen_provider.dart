import 'package:base_structure_project/enums/view_state.dart';
import 'package:flutter/material.dart';

/// [MainScreenProvider] is a provider for changing bottomNavigation screens
class MainScreenProvider extends ChangeNotifier {
  int _bottomNavigationCounter = 0;

  void setBottomNavigationCounter(int num) {
    _bottomNavigationCounter = num;
    notifyListeners();
  }

  int get bottomNavigationCounter => _bottomNavigationCounter;

  /// Slider example for Query GraphQl requesting

  List<String> _slider = [];

  List<String> get slider => _slider;

  void setSlider(List<String> newSlider) {
    _slider = newSlider;
    notifyListeners();
  }

  ViewState _sliderViewState = ViewState.preparing;

  ViewState get sliderViewState => _sliderViewState;

  void setSliderViewState(ViewState newSliderViewState) {
    _sliderViewState = newSliderViewState;
    notifyListeners();
  }

  /// Remove Item example for Mutation GraphQl requesting

  ViewState _removeItemViewState = ViewState.preparing;

  ViewState get removeItemViewState => _removeItemViewState;

  void setRemoveItemViewState(ViewState viewState) {
    _removeItemViewState = viewState;
    notifyListeners();
  }
}
