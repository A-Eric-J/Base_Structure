import 'package:base_structure_project/const_values/route_paths.dart';
import 'package:base_structure_project/locator.dart';
import 'package:base_structure_project/providers/authentication_provider.dart';
import 'package:base_structure_project/services/navigation_service.dart';
import 'package:base_structure_project/services/shared_preference_service/shared_preference.dart';
import 'package:base_structure_project/ui/shared/colors.dart';
import 'package:base_structure_project/ui/shared/text.dart';
import 'package:flutter/material.dart';
import 'package:base_structure_project/ui/widgets/blog.dart';
import 'package:base_structure_project/ui/widgets/textformfield/textformfield_widget.dart';
import 'package:provider/provider.dart';

class TextFormFieldCodeReceive extends StatefulWidget {
  final TextEditingController textController;

  const TextFormFieldCodeReceive({
    Key? key,
    required this.textController,
  }) : super(key: key);

  @override
  State<TextFormFieldCodeReceive> createState() =>
      _TextFormFieldCodeReceiveState();
}

class _TextFormFieldCodeReceiveState extends State<TextFormFieldCodeReceive> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.0053),
      child: Stroke(
          height: width * 0.1333,
          width: width * 0.1333,
          disableBorderColor: widget.textController.text.isEmpty
              ? disableTextFiledColor
              : enableTextFiledColor,
          radius: width * 0.032,
          child: Consumer<AuthenticationLoginProvider>(
              builder: (context, authenticationProvider, child) {
            return Center(
              child: TextFormFieldWidget(
                maxLength: 1,
                controller: widget.textController,
                labelText: codeReceiveLabelText,
                contentPadding: EdgeInsets.only(
                  bottom: width * 0.02,
                ),
                onChanged: (value) async {
                  setState(() {});
                  if (authenticationProvider.activationCode().length == 4) {
                    /// we have commented this because this request is fake
                    /// it means that you should add your authVerifyCode request here and after that
                    /// if it was successful go to mainView
                    // var passedCodeReceiveScreen =
                    //     await AuthenticationService.authVerifyCode(
                    //         Provider.of(context, listen: false),
                    //         Provider.of(context, listen: false),
                    //         /// this is for when we want to covert numbers
                    //         /// from another languages to english to send them to server
                    //         // convertPersianNumberToEnglishNumber(
                    //         //     authenticationProvider.activationCode())
                    //         authenticationProvider.activationCode()
                    //     );
                    // if (passedCodeReceiveScreen) {
                    //   SharedPreference.setLoginState(true);
                    //
                    //   if (authenticationProvider.registered) {
                    //     locator<NavigationService>().goBackUntilTheFirstRoute();
                    //     locator<NavigationService>().navigateTo(
                    //         RoutePaths.mainViewPath,
                    //         arguments: false,
                    //         pushReplacement: true);
                    //   } else {
                    //     locator<NavigationService>().navigateTo(
                    //         RoutePaths.registerPath,
                    //         arguments: false,
                    //         pushReplacement: true);
                    //   }
                    //   locator<NavigationService>().navigateTo(
                    //       RoutePaths.mainViewPath,
                    //       arguments: false,
                    //       pushReplacement: true);
                    // } else {
                    //   if (!mounted) return;
                    //   snackBar(insertedCodeNotVerifiedText, context);
                    // }
                    SharedPreference.setLoginState(true);
                    locator<NavigationService>().navigateTo(
                        RoutePaths.mainViewPath,
                        pushReplacement: true);
                  }
                },
              ),
            );
          })),
    );
  }
}
