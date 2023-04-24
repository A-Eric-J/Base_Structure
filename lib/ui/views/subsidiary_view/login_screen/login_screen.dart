import 'package:base_structure_project/providers/authentication_provider.dart';
import 'package:flutter/material.dart';
import 'package:base_structure_project/const_values/route_paths.dart';
import 'package:base_structure_project/enums/view_state.dart';
import 'package:base_structure_project/locator.dart';
import 'package:base_structure_project/services/navigation_service.dart';
import 'package:base_structure_project/ui/shared/colors.dart';
import 'package:base_structure_project/ui/shared/text.dart';
import 'package:base_structure_project/ui/widgets/button/button.dart';
import 'package:base_structure_project/ui/widgets/masked_text_controller.dart';
import 'package:base_structure_project/ui/widgets/textformfield/textformfield_item/textformfield_item.dart';
import 'package:base_structure_project/ui/widgets/views/subsidiary_view/login_screen/login_screen_header.dart';
import 'package:base_structure_project/ui/extensions/widget_extension.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneNumberTextController =
      MaskedTextController(mask: '0', length: 9);

  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    phoneNumberTextController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: white,
        body: SafeArea(child: Consumer<AuthenticationLoginProvider>(
            builder: (context, authenticationLoginProvider, child) {
          return NotificationListener(
            onNotification: (ScrollNotification scrollNotification) {
              if (scrollNotification is ScrollUpdateNotification) {
                if (scrollNotification.metrics.pixels < 0) {
                  _scrollController.jumpTo(0);
                }
              }
              return true;
            },
            child: SingleChildScrollView(
                controller: _scrollController,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * 0.064),
                  child: Column(children: <Widget>[
                    const LoginHeader(),
                    TextFormFieldItem(
                      onChanged: (value) => setState(() {}),
                      labelText: phoneNumberLabelText,
                      textController: phoneNumberTextController,
                    ),
                    SizedBox(
                      height: width * 0.2,
                    ),
                    loginButton(width, context),
                    SizedBox(
                      height: width * 0.1,
                    ),
                  ]),
                )),
          ).withBusyOverlay(
              authenticationLoginProvider.loginState == ViewState.busy);
        })));
  }

  Widget loginButton(double width, BuildContext context) {
    return Container(
      width: width,
      alignment: Alignment.centerRight,
      child: RectAngleButton(
          state: ViewState.ready,
          color: phoneNumberTextController.text.length == 9
              ? brandMainColor
              : secondaryDark,
          width: width * 0.4666,
          nameOfButton: nextButtonText,
          onTap: phoneNumberTextController.text.length == 9
              ? () => login(context)
              : null),
    );
  }

  void login(BuildContext context) async {
    /// we have commented this because this request is fake
    /// it means that you should add your login request here and after that
    /// if it was successful go to codeReceive screen
    // var loggedInSuccessfully = await AuthenticationService.authSendCode(
    //     Provider.of(context, listen: false),
    //     Provider.of(context, listen: false),
    //     convertPersianNumberToEnglishNumber(
    //         zeroNineText + phoneNumberTextController.text));
    // if (loggedInSuccessfully) {
    //   locator<NavigationService>().navigateTo(RoutePaths.codeReceivePath);
    // } else {
    //   if (!mounted) return;
    //   snackBar(tryAgainAfterMinuteText, context);
    // }
    locator<NavigationService>().navigateTo(RoutePaths.codeReceivePath);
  }
}
