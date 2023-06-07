import 'dart:developer';
import 'package:base_structure_project/const_values/urls.dart';
import 'package:base_structure_project/enums/response_status.dart';
import 'package:base_structure_project/enums/view_state.dart';
import 'package:base_structure_project/models/user.dart';
import 'package:base_structure_project/providers/main_screen_provider.dart';
import 'package:base_structure_project/providers/profile_provider.dart';
import 'package:base_structure_project/services/web_service_graph_ql.dart';
import 'package:base_structure_project/services/web_service_rest.dart';
import 'package:flutter/foundation.dart';

/// [MainService] is a mock for showing get request to server for getting user information
class MainService {
  /// Rest API request
  static Future<void> getUserInfo(
    WebServiceRest webService,
    ProfileProvider profileProvider,
  ) async {
    profileProvider.setUserViewState(ViewState.busy);
    var response = await webService.getFunction(URLs.getUserInfoUrl);
    if (response.responseStatus == ResponseStatus.success) {
      var responseBody = response.body as Map<String, dynamic>;
      if (responseBody.isNotEmpty) {
        profileProvider.setUser(User.fromJson(responseBody));
      }
      profileProvider.setUserViewState(ViewState.ready);
    } else {
      profileProvider.setUserViewState(ViewState.failed);
    }
  }

  /// GraphQl API request

  /// This is how a query graphQl request works
  static Future<bool> getSlider(
    WebServiceGraphQl webServiceGraphQl,
    MainScreenProvider mainScreenProvider,
  ) async {
    mainScreenProvider.setSliderViewState(ViewState.busy);
    var response = await webServiceGraphQl.query(
        URLs.slidersQuery(),

        /// this map is variable for query graphQl
        {"type": 1},
        withAuth: false);
    if (response.isSuccess) {
      var sliders = <String>[];
      for (var slider in response.body!['slider']) {
        sliders.add(slider['image']);
      }
      mainScreenProvider.setSlider(sliders);
      mainScreenProvider.setSliderViewState(ViewState.ready);
      return true;
    } else {
      mainScreenProvider.setSliderViewState(ViewState.failed);
      if (kDebugMode) {
        print(response.graphqlError!.message);
      }
      return false;
    }
  }

  /// This is how a mutation graphQl request works

  static Future<bool> removeItem(
    WebServiceGraphQl webServiceGraphQl,
    MainScreenProvider mainScreenProvider,
    Map<String, dynamic> variable,
  ) async {
    mainScreenProvider.setRemoveItemViewState(ViewState.busy);
    var response =
        await webServiceGraphQl.mutate(URLs.removeItemMutation(), variable);
    if (response.isSuccess) {
      var message = response.body!['removeItem']['message'] as String;
      log('message: $message');
      mainScreenProvider.setRemoveItemViewState(ViewState.ready);
      return true;
    } else {
      mainScreenProvider.setRemoveItemViewState(ViewState.failed);
      if (kDebugMode) {
        print(response.graphqlError!.message);
      }
      return false;
    }
  }
}
