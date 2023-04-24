import 'package:flutter/material.dart';
import 'package:base_structure_project/enums/appbar_state.dart';
import 'package:base_structure_project/locator.dart';
import 'package:base_structure_project/services/navigation_service.dart';
import 'package:base_structure_project/ui/shared/colors.dart';
import 'package:base_structure_project/ui/widgets/button/button.dart';
import 'package:base_structure_project/ui/widgets/text/text_view.dart';

class CustomAppBar extends StatelessWidget {
  final String title;
  final AppBarState? appBarState;
  final VoidCallback? closingOnTap;
  final VoidCallback? backingOnTap;
  final double? size;
  final EdgeInsetsGeometry? padding;

  const CustomAppBar(
      {Key? key,
      required this.title,
      this.appBarState,
      this.closingOnTap,
      this.backingOnTap,
      this.size,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: padding ??
          EdgeInsets.symmetric(
              vertical: width * 0.0266, horizontal: width * 0.04),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          button(appBarState, context),
          SizedBox(
            width: width * 0.0266,
          ),
          Expanded(
            child: TextView(
              text: title,
              size: size ?? 18,
              color: primaryTextColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }

  Widget button(appBarState, context) {
    switch (appBarState) {
      case AppBarState.closing:
        return ClosingButton(
          onTap: closingOnTap ??
              () {
                locator<NavigationService>().goBack();
              },
        );

      case AppBarState.backing:
        return BackingButton(
          onTap: backingOnTap ??
              () {
                locator<NavigationService>().goBack();
              },
        );
    }
    return Container();
  }
}
