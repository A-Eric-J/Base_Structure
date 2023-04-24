import 'package:flutter/material.dart';
import 'package:base_structure_project/const_values/assets.dart';
import 'package:base_structure_project/ui/widgets/blog.dart';

class OnBoardingPage extends StatelessWidget {
  final int number;
  final Widget textColumn;

  const OnBoardingPage({
    super.key,
    required this.number,
    required this.textColumn,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ImageAndIconFill(
          path: imageSource(number),
          width: width < 330 ? width * 0.7 : null,
          height: width < 330 ? width * 0.78 : null,
        ),
        textColumn,
      ],
    );
  }

  String imageSource(int number) {
    switch (number) {
      case 1:
        return Assets.firstOnBoardingPage;
      case 2:
        return Assets.secondOnBoardingPage;
      case 3:
        return Assets.thirdOnBoardingPage;
      default:
        return Assets.placeHolder;
    }
  }
}
