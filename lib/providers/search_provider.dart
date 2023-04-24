import 'package:base_structure_project/enums/view_state.dart';
import 'package:base_structure_project/models/search_model.dart';
import 'package:flutter/material.dart';

/// [SearchProvider] is a common provider for searching,
/// customize it according to your needs
class SearchProvider extends ChangeNotifier {
  ViewState _searchModelState = ViewState.preparing;

  ViewState get searchModelState => _searchModelState;

  void setSearchModelState(ViewState state) {
    _searchModelState = state;
    notifyListeners();
  }

  var _searchModelList = <SearchModel>[];

  List<SearchModel> get searchModelList => _searchModelList;

  void setSearchModelList(List<SearchModel> newSearchModel) {
    if (_text.isEmpty) {
      searchClear();
    } else {
      _searchModelList = newSearchModel;
      notifyListeners();
    }
  }

  var _text = '';

  String get text => _text;

  void setText(String text) {
    _text = text;
  }

  void searchClear() {
    _text = '';
    _searchModelState = ViewState.preparing;
    _searchModelList.clear();
    notifyListeners();
  }
}
