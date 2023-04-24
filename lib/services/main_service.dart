import 'package:base_structure_project/const_values/urls.dart';
import 'package:base_structure_project/enums/response_status.dart';
import 'package:base_structure_project/enums/view_state.dart';
import 'package:base_structure_project/models/user.dart';
import 'package:base_structure_project/providers/profile_provider.dart';
import 'package:base_structure_project/services/web_service.dart';

/// [MainService] is a mock for showing get request to server for getting user information
class MainService {
  static Future<void> getUserInfo(
    WebService webService,
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
}
