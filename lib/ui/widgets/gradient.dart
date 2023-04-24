import 'package:flutter/material.dart';
import 'package:base_structure_project/enums/gradient_type.dart';
import 'package:base_structure_project/ui/shared/colors.dart';

/// We use a Container with  LinearGradient for some screens and widgets named
/// [MainGradient] that has different behaviours based on [GradientType]
class MainGradient extends StatelessWidget {
  final double? width;
  final double? height;
  final GradientType gradientType;
  final Widget child;

  const MainGradient({
    Key? key,
    this.width,
    this.height,
    required this.gradientType,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      height: height,
      width: this.width ?? width,
      decoration: boxDecoration(gradientType, width),
      child: child,
    );
  }

  BoxDecoration boxDecoration(GradientType gradientType, width) {
    switch (gradientType) {
      case GradientType.loginScreen:
        return const BoxDecoration();
      case GradientType.homeScreen:
        return BoxDecoration(
            gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
              white,
              mainBackgroundColor.withOpacity(0.6),
              mainBackgroundColor.withOpacity(0.7),
              mainBackgroundColor.withOpacity(0.8),
              mainBackgroundColor.withOpacity(0.9),
            ],
                stops: const [
              0.1,
              0.3,
              0.5,
              0.7,
              0.9
            ]));
      default:
        return const BoxDecoration();
    }
  }
}
