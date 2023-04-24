import 'package:flutter/material.dart';
import 'package:base_structure_project/ui/shared/colors.dart';
import 'package:base_structure_project/ui/widgets/button/icon_button.dart';

class NextPageButton extends StatelessWidget {
  final VoidCallback onPressed;

  const NextPageButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return RawMaterialButton(
      elevation: 0.0,
      shape: const CircleBorder(),
      fillColor: brandMainColor,
      onPressed: onPressed,
      child: Padding(
          padding: EdgeInsets.all(width * 0.04),
          child: ArrowForwardIcon(
            color: white,
            size: width * 0.064,
          )),
    );
  }
}
