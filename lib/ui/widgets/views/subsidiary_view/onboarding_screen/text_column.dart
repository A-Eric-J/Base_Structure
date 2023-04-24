import 'package:flutter/material.dart';
import 'package:base_structure_project/ui/shared/colors.dart';
import 'package:base_structure_project/ui/widgets/text/text_view.dart';

class TextColumn extends StatelessWidget {
  final String title;
  final String text;

  const TextColumn({
    super.key,
    required this.title,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        TextView(
          text: title,
          textAlign: TextAlign.center,
          color: primaryTextColor,
          fontWeight: FontWeight.bold,
          size: width > 400 ? 22 : 18,
        ),
        SizedBox(height: width * 0.0266),
        TextView(
          text: text,
          color: primaryDark,
          size: width > 400 ? 16 : 14,
          textAlign: TextAlign.center,
        ),
        SizedBox(height: width * 0.0266),
      ],
    );
  }
}
