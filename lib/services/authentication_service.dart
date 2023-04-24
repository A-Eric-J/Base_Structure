import 'package:base_structure_project/const_values/urls.dart';
import 'package:base_structure_project/enums/response_status.dart';
import 'package:base_structure_project/enums/view_state.dart';
import 'package:base_structure_project/providers/authentication_provider.dart';
import 'package:base_structure_project/services/shared_preference_service/shared_preference.dart';
import 'package:base_structure_project/services/web_service.dart';

/// [AuthenticationService] is a mock for showing post request to server
class AuthenticationService {
  /// for example [authSendCode] is for sending phoneNumber for authenticating
  static Future<bool> authSendCode(
      WebService webService,
      AuthenticationLoginProvider authenticationProvider,
      String phoneNumber) async {
    authenticationProvider.setLoginState(ViewState.busy);
    var response = await webService
        .postFunction(URLs.authSendCodeUrl, body: {'phoneNumber': phoneNumber});
    if (response.responseStatus == ResponseStatus.created) {
      authenticationProvider.setPhoneNumber(response.body?['phoneNumber']);
      authenticationProvider.setVerificationId(response.body?['id']);
      authenticationProvider.setLoginState(ViewState.ready);
      return true;
    } else {
      authenticationProvider.setLoginState(ViewState.failed);
      return false;
    }
  }

  /// for example [authVerifyCode] is for checking that verifyCode is true or not for authenticating
  static Future<bool> authVerifyCode(
      WebService webService,
      AuthenticationLoginProvider authenticationProvider,
      String verifyCode) async {
    authenticationProvider.setCodeReceiveScreenState(ViewState.busy);
    var mapBody = {
      'id': authenticationProvider.verificationId,
      'code': verifyCode,
      'type': 'user',
      'phoneNumber': authenticationProvider.phoneNumber
    };
    var response =
        await webService.postFunction(URLs.authVerifyCodeUrl, body: mapBody);
    if (response.responseStatus == ResponseStatus.created) {
      SharedPreference.setToken(response.body?['token']);
      authenticationProvider.setRegistered(response.body?['registered']);
      authenticationProvider.setCodeReceiveScreenState(ViewState.ready);
      return true;
    } else {
      authenticationProvider.clear();
      authenticationProvider.setCodeReceiveScreenState(ViewState.failed);
      return false;
    }
  }
}
