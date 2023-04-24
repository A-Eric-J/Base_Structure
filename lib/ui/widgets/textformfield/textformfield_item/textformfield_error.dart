import 'package:flutter/material.dart';
import 'package:base_structure_project/ui/shared/colors.dart';
import 'package:base_structure_project/ui/widgets/button/icon_button.dart';
import 'package:base_structure_project/ui/widgets/text/text_view.dart';

class TextFormFieldError extends StatelessWidget {
  final String? title;

  const TextFormFieldError({Key? key, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextView(
          text: title ?? ' ',
          size: 12,
          color: primaryErrorColor,
        ),
        SizedBox(
          width: width * 0.024,
        ),
        const InfoIcon(
          color: primaryErrorColor,
        )
      ],
    );
  }
}
