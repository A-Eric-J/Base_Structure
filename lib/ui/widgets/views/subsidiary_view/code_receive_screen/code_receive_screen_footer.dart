import 'package:flutter/material.dart';
import 'package:base_structure_project/providers/authentication_provider.dart';
import 'package:base_structure_project/ui/shared/colors.dart';
import 'package:base_structure_project/ui/shared/text.dart';
import 'package:base_structure_project/ui/widgets/button/button.dart';
import 'package:base_structure_project/ui/widgets/text/text_view.dart';
import 'package:provider/provider.dart';

class CodeReceiveFooter extends StatelessWidget {
  const CodeReceiveFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Consumer<AuthenticationLoginProvider>(
        builder: (context, authenticationLoginProvider, child) {
      return Padding(
        padding: EdgeInsets.only(
            bottom: width * 0.0266,
            top: width * 0.064,
            left: width * 0.064,
            right: width * 0.064),
        child: authenticationLoginProvider.secondsCount == 0
            ? SizedBox(
                width: width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const TextView(
                      text: didNotReceiveTheCode,
                      size: 14,
                      color: primaryDark,
                    ),
                    ResendTheCodeButton(onTap: () async {
                      /// again we have commented this request like the others
                      // var resendCodeAgain =
                      // await AuthenticationService.authSendCode(
                      //     Provider.of(context, listen: false),
                      //     Provider.of(context, listen: false),
                      //     authenticationLoginProvider
                      //         .phoneNumber);
                      // if (resendCodeAgain) {
                      //   print('code resent successfully');
                      //   authenticationLoginProvider.startTimer();
                      // }

                      authenticationLoginProvider.startTimer();
                    }),
                  ],
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextView(
                    text: authenticationLoginProvider.secondsCount.toString(),
                    size: 14,
                    color: primaryDark,
                  ),
                  SizedBox(
                    width: width * 0.0106,
                  ),
                  const TextView(
                    text: secondsToResendTheCode,
                    size: 14,
                    color: primaryDark,
                  ),
                ],
              ),
      );
    });
  }
}
