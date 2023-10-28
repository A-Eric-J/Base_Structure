import 'package:flutter/material.dart';
import 'package:base_structure_project/ui/widgets/blog.dart';
import 'package:base_structure_project/ui/widgets/button/icon_button.dart';
import 'package:base_structure_project/ui/widgets/textformfield/textformfield_widget.dart';

class SearchBarWidget extends StatelessWidget {
  final TextEditingController textController;
  final String labelText;
  final EdgeInsetsGeometry? padding;
  final Function(String)? onChanged;
  final Color? backgroundColor;
  final Color? borderColor;
  final bool enable;
  final VoidCallback? onTap;

  const SearchBarWidget(
      {Key? key,
      this.padding,
      this.onChanged,
      required this.textController,
      required this.labelText,
      this.backgroundColor,
      this.borderColor,
      this.enable = true,
      this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Padding(
        padding: padding ?? EdgeInsets.zero,
        child: Stroke(
          onTap: onTap,
          radius: width * 0.0266,
          disableBorderColor: borderColor,
          backgroundColor: backgroundColor,
          child: Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: width * 0.0213, right: width * 0.0426),
                child: const SearchIcon(),
              ),
              Expanded(
                child: TextFormFieldWidget(
                  maxLines: 1,
                  enable: enable,
                  controller: textController,
                  labelText: labelText,
                  contentPadding: EdgeInsets.symmetric(vertical: width * 0.032),
                  textSize: 13,
                  onChanged: onChanged,
                ),
              ),
            ],
          ),
        ));
  }
}
