import 'package:base_structure_project/enums/view_state.dart';
import 'package:flutter/material.dart';


class HomeProvider extends ChangeNotifier {

  /// This is for when we have requesting to the server in homeScreen and we need to know about requesting to the server
  ViewState _homeScreenState = ViewState.preparing;

  ViewState get homeScreenState => _homeScreenState;

  void setHomeScreenState(ViewState state) {
    _homeScreenState = state;
    notifyListeners();
  }
 /// According to the model object of this screen add your specific object here

  void clear() {
    _homeScreenState= ViewState.preparing;
    notifyListeners();
  }
}
