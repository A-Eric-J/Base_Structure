import 'package:flutter/material.dart';
import 'package:base_structure_project/ui/shared/colors.dart';
import 'package:base_structure_project/ui/widgets/button/button.dart';
import 'package:base_structure_project/ui/widgets/text/text_view.dart';

class SwitchAndTitle extends StatelessWidget {
  final bool isSwitched;
  final Function(bool) toggleSwitch;
  final String title;
  final String? description;

  const SwitchAndTitle(
      {Key? key,
      required this.isSwitched,
      required this.toggleSwitch,
      required this.title,
      this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomSwitchButton(
              isSwitched: isSwitched,
              toggleSwitch: toggleSwitch,
            ),
            TextView(
              text: title,
              size: 14,
              color: primaryTextColor,
            )
          ],
        ),
        if (description != null)
          TextView(
            text: description!,
            size: 11,
            color: primaryGray,
          ),
      ],
    );
  }
}
