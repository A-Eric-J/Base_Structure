import 'package:base_structure_project/ui/widgets/text/text_view.dart';
import 'package:flutter/material.dart';
import 'package:base_structure_project/ui/shared/colors.dart';
import 'package:base_structure_project/ui/widgets/button/icon_button.dart';

class CustomTappableListTile extends StatelessWidget {
  final String title;
  final Widget icon;
  final VoidCallback? onTap;

  const CustomTappableListTile(
      {Key? key, required this.title, this.onTap, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return InkWell(
        onTap: onTap,
        child: Container(
          color: white,
          width: width,
          child: Column(children: [
            Padding(
              padding: EdgeInsets.symmetric(
                  vertical: width * 0.0586, horizontal: width * 0.0426),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Row(
                    children: [
                      icon,
                      SizedBox(
                        width: width * 0.01,
                      ),
                      TextView(text: title, size: 14)
                    ],
                  ),
                  const ArrowForwardIcon(),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: width * 0.0426),
              child: const Divider(
                thickness: 1,
                height: 1,
                color: disableTextFiledColor,
              ),
            )
          ]),
        ));
  }
}
