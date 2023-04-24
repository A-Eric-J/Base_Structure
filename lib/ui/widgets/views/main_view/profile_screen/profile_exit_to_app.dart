import 'package:flutter/material.dart';
import 'package:base_structure_project/const_values/route_paths.dart';
import 'package:base_structure_project/enums/view_state.dart';
import 'package:base_structure_project/locator.dart';
import 'package:base_structure_project/providers/profile_provider.dart';
import 'package:base_structure_project/services/navigation_service.dart';
import 'package:base_structure_project/services/shared_preference_service/shared_preference.dart';
import 'package:base_structure_project/ui/shared/colors.dart';
import 'package:base_structure_project/ui/shared/text.dart';
import 'package:base_structure_project/ui/widgets/blog.dart';
import 'package:base_structure_project/ui/widgets/button/button.dart';
import 'package:base_structure_project/ui/widgets/button/icon_button.dart';
import 'package:base_structure_project/ui/widgets/text/text_view.dart';
import 'package:provider/provider.dart';

class ProfileExitToApp extends StatelessWidget {
  const ProfileExitToApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: width * 0.08, bottom: width * 0.0533),
          child: Stroke(
            height: width * 0.208,
            width: width * 0.208,
            radius: width * 0.1066,
            borderWidth: 0,
            backgroundColor: primaryErrorColor,
            disableShadowColor: primaryErrorColor,
            child: ExitToAppIcon(
              color: white,
              size: width * 0.0933,
            ),
          ),
        ),
        const TextView(
          text: logoutText,
          size: 20,
          color: primaryErrorColor,
          fontWeight: FontWeight.w700,
        ),
        Padding(
          padding: EdgeInsets.symmetric(
              horizontal: width * 0.08, vertical: width * 0.0266),
          child: const TextView(
            text: areYouSureYouWantToLogoutText,
            size: 16,
            color: primaryTextColor,
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(
              top: width * 0.08,
              right: width * 0.04,
              left: width * 0.04,
              bottom: width * 0.08),
          child: Container(
            color: white,
            child: Row(
              children: [
                Expanded(
                  child: RectAngleButton(
                    state: ViewState.ready,
                    height: width * 0.1333,
                    nameOfButton: iAmLeavingText,
                    color: primaryErrorColor,
                    onTap: () => logout(context),
                  ),
                ),
                SizedBox(
                  width: width * 0.0666,
                ),
                RectAngleButton(
                  state: ViewState.ready,
                  height: width * 0.1333,
                  width: width * 0.3466,
                  nameOfButton: iGaveUpText,
                  textSize: 15,
                  textColor: previousColor,
                  color: white,
                  borderColor: previousColor,
                  onTap: () {
                    locator<NavigationService>().goBack();
                  },
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  void logout(context) {
    SharedPreference.logout();
    Provider.of<ProfileProvider>(context, listen: false).clear();

    /// you should clear all the datas of the user that was logged in
    locator<NavigationService>().goBack();
    locator<NavigationService>()
        .navigateTo(RoutePaths.loginPath, pushReplacement: true);
  }
}
