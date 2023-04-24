import 'package:flutter/material.dart';
import 'package:base_structure_project/enums/view_state.dart';
import 'package:base_structure_project/locator.dart';
import 'package:base_structure_project/providers/authentication_provider.dart';
import 'package:base_structure_project/services/navigation_service.dart';
import 'package:base_structure_project/ui/shared/colors.dart';
import 'package:base_structure_project/ui/shared/text.dart';
import 'package:base_structure_project/ui/widgets/button/button.dart';
import 'package:base_structure_project/ui/widgets/text/text_view.dart';
import 'package:base_structure_project/ui/widgets/views/subsidiary_view/code_receive_screen/code_receive_screen_footer.dart';
import 'package:base_structure_project/ui/widgets/views/subsidiary_view/code_receive_screen/code_receive_textformfields_list.dart';
import 'package:provider/provider.dart';
import 'package:base_structure_project/ui/extensions/widget_extension.dart';

class CodeReceiveScreen extends StatefulWidget {
  const CodeReceiveScreen({super.key});

  @override
  State<CodeReceiveScreen> createState() => _CodeReceiveScreenState();
}

class _CodeReceiveScreenState extends State<CodeReceiveScreen> {
  var error = false;
  AuthenticationLoginProvider? authenticationLoginProvider;
  final _scrollController = ScrollController();

  @override
  void initState() {
    authenticationLoginProvider =
        Provider.of<AuthenticationLoginProvider>(context, listen: false);
    authenticationLoginProvider!.initializeCodeReceive();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      authenticationLoginProvider!.startTimer();
    });
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    authenticationLoginProvider!.disposeCodeReceive();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
        backgroundColor: white,
        body: SafeArea(child: Consumer<AuthenticationLoginProvider>(
            builder: (context, authenticationProvider, snapshot) {
          return Stack(
            children: [
              Column(
                children: [
                  Expanded(
                    child: NotificationListener(
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
                        child: Column(
                          children: [
                            codeReceiveHeader(

                                /// you will see that the phone number is not shown to you
                                /// because we have commented the previous request to server
                                width,
                                authenticationProvider.phoneNumber),
                            const CodeReceiveTextFormFieldsList(),
                            SizedBox(
                              height: width * 0.1493,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const CodeReceiveFooter()
                ],
              )
            ],
          ).withBusyOverlay(
              authenticationProvider.codeReceiveScreenState == ViewState.busy);
        })));
  }

  Widget codeReceiveHeader(double width, String phoneNumber) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.064),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: width * 0.266,
            ),
            Container(
              width: width,
              alignment: Alignment.centerLeft,
              child: BackingButton(
                borderColor: primaryDark,
                onTap: () {
                  locator<NavigationService>().goBack();
                },
              ),
            ),
            SizedBox(
              height: width * 0.0773,
            ),
            const TextView(
              text: enterTheActivationCodeText,
              size: 20,
              color: primaryDark,
              fontWeight: FontWeight.w700,
            ),
            SizedBox(
              height: width * 0.0186,
            ),
            TextView(
              text: theActivationCodeWasSentText(phoneNumber),
              size: 15,
              color: primaryDark,
            ),
            SizedBox(
              height: width * 0.1,
            ),
          ]),
    );
  }
}
