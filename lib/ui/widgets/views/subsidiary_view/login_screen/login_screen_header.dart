import 'package:flutter/material.dart';
import 'package:base_structure_project/const_values/assets.dart';
import 'package:base_structure_project/ui/shared/colors.dart';
import 'package:base_structure_project/ui/shared/text.dart';
import 'package:base_structure_project/ui/widgets/blog.dart';
import 'package:base_structure_project/ui/widgets/text/text_view.dart';

class LoginHeader extends StatelessWidget {
  const LoginHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: width * 0.2666,
          ),
          Container(
            width: width,
            alignment: Alignment.center,
            child: ImageAndIconFill(
              path: Assets.logo,
              width: width * 0.2313,
              height: width * 0.25,
            ),
          ),
          SizedBox(
            height: width * 0.1333,
          ),
          const TextView(
            text: welcomeToTheAppText,
            size: 18,
            color: primaryDark,
            fontWeight: FontWeight.w800,
          ),
          SizedBox(
            height: width * 0.024,
          ),
          const TextView(
            text: pleaseEnterYourPhoneNumberText,
            size: 14,
            color: primaryDark,
          ),
          SizedBox(
            height: width * 0.08,
          ),
        ],
      ),
    );
  }
}
