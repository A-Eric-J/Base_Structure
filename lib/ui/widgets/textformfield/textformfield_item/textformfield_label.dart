import 'package:flutter/material.dart';
import 'package:base_structure_project/ui/shared/colors.dart';
import 'package:base_structure_project/ui/widgets/text/text_view.dart';

class TextFormFieldLabel extends StatelessWidget {
  final String labelText;

  const TextFormFieldLabel({Key? key, this.labelText = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.0426),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: width * 0.0106),
        color: white,
        child: TextView(
          text: labelText,
          size: 15,
          color: enableTextFiledColor,
        ),
      ),
    );
  }
}
