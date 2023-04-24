import 'package:flutter/material.dart';
import 'package:base_structure_project/models/option.dart';
import 'package:base_structure_project/ui/shared/colors.dart';
import 'package:base_structure_project/ui/widgets/blog.dart';
import 'package:base_structure_project/ui/widgets/text/text_view.dart';

class DescriptionBuilder extends StatelessWidget {
  final List<Option> options;
  final EdgeInsetsGeometry? padding;
  final bool isColumn;
  final bool moreDescription;

  const DescriptionBuilder(
      {Key? key,
      this.padding,
      required this.options,
      this.isColumn = false,
      this.moreDescription = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Padding(
      padding: padding ?? EdgeInsets.zero,
      child: Stroke(
        backgroundColor: secondaryDark.withOpacity(0.1),
        radius: width * 0.024,
        child: Column(
          children: _descriptionBodyBuilder(width),
        ),
      ),
    );
  }

  List<Widget> _descriptionBodyBuilder(double width) {
    var descriptions = <Widget>[];
    var index = 0;
    for (var option in options) {
      descriptions.add(SizedBox(
        width: width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.0266),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(vertical: width * 0.0266),
                child: !isColumn
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextView(
                            text: option.value!,
                            textAlign: TextAlign.left,
                            color: primaryTextColor,
                            size: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          Expanded(
                            child: TextView(
                              text: '${option.title}',
                              color: primaryTextColor,
                              size: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      )
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextView(
                            text: '${option.title}',
                            color: primaryTextColor,
                            size: 14,
                            fontWeight: FontWeight.w500,
                          ),
                          TextView(
                            text: option.value!,
                            color: textGray,
                            size: 13,
                            textAlign: TextAlign.left,
                          )
                        ],
                      ),
              ),
              if (index != (options.length) - 1 &&
                  !(!moreDescription && index == 1))
                const Divider()
            ],
          ),
        ),
      ));
      index++;
    }
    if (!moreDescription) {
      descriptions = descriptions.sublist(0, 2);
    }
    return descriptions;
  }
}
