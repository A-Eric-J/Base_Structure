import 'package:flutter/material.dart';
import 'package:base_structure_project/ui/shared/colors.dart';
import 'package:base_structure_project/ui/widgets/text/text_view.dart';

class BottomNavigationItem extends StatelessWidget {
  final String label;
  final IconData iconData;
  final bool activated;

  const BottomNavigationItem(
      {Key? key,
      required this.label,
      required this.activated,
      required this.iconData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          iconData,
          color: activated ? brandMainColor : mainViewUnSelectedItemColor,
          size: width * 0.0426,
        ),
        TextView(
          text: label,
          size: 10,
          color: activated ? brandMainColor : mainViewUnSelectedItemColor,
        )
      ],
    );
  }
}
