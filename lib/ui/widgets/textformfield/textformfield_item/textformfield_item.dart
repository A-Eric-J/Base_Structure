import 'package:base_structure_project/ui/shared/colors.dart';
import 'package:base_structure_project/ui/shared/text.dart';
import 'package:flutter/material.dart';
import 'package:base_structure_project/ui/widgets/blog.dart';
import 'package:base_structure_project/ui/widgets/button/icon_button.dart';
import 'package:base_structure_project/ui/widgets/text/text_view.dart';
import 'package:base_structure_project/ui/widgets/textformfield/textformfield_item/textformfield_error.dart';
import 'package:base_structure_project/ui/widgets/textformfield/textformfield_widget.dart';

class TextFormFieldItem extends StatefulWidget {
  final String labelText;
  final String? errorLabel;
  final TextEditingController textController;
  final Function(String)? onChanged;
  final double? minHeight;
  final String? initialText;
  final bool? enable;
  final VoidCallback? onTapDiscountForAdding;
  final VoidCallback? onTapDiscountForDeleting;
  final int? maxLines;

  const TextFormFieldItem(
      {Key? key,
      required this.labelText,
      required this.textController,
      this.onChanged,
      this.minHeight,
      this.initialText,
      this.enable = true,
      this.onTapDiscountForAdding,
      this.maxLines,
      this.errorLabel = '',
      this.onTapDiscountForDeleting})
      : super(key: key);

  @override
  State<TextFormFieldItem> createState() => _TextFormFieldItemState();
}

class _TextFormFieldItemState extends State<TextFormFieldItem> {
  bool error = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: width * 0.032),
          child: StrokeAndLabel(
            minHeight: widget.minHeight,
            borderColor: borderColor(error),
            radius: width * 0.032,
            labelText: widget.labelText,
            child: _isCenterTextFormField(widget.minHeight == null, width),
          ),
        ),
        if (error)
          TextFormFieldError(
            title: errorLabel(),
          )
      ],
    );
  }

  Widget _textFormField(double width) {
    return TextFormFieldWidget(
      initialText: widget.initialText,
      enable: widget.enable,
      maxLines: widget.maxLines,
      error: (error) {
        setState(() {
          this.error = error;
        });
      },
      controller: widget.textController,
      labelText: widget.labelText,
      contentPadding: EdgeInsets.only(
        left: width * 0.032,
        right: width * 0.032,
        bottom: width * 0.03,
        top: width * 0.04,
      ),
      prefix: ((widget.labelText == phoneNumberLabelText ||
              widget.labelText == referralCodeLabelText)
          ? Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Visibility(
                  visible: widget.textController.text.isNotEmpty,
                  child: Container(
                      padding: EdgeInsets.only(right: width * 0.048),
                      child: RemoveIcon(
                        onTap: () {
                          setState(() {
                            widget.textController.clear();
                            widget.onChanged!('');
                          });
                        },
                      )),
                ),
                const TextView(
                  text: zeroNineText,
                  size: 18,
                  color: primaryDark,
                )
              ],
            )
          : Visibility(
              visible: widget.textController.text.isNotEmpty,
              child: Container(
                  padding: EdgeInsets.only(left: width * 0.048),
                  child: RemoveIcon(
                    onTap: () {
                      setState(() {
                        if (widget.labelText == emailLabelText) {
                          error = false;
                        }
                        widget.textController.clear();
                        widget.onChanged!('');
                      });
                    },
                  )))),
      onChanged: (value) {
        setState(() {
          widget.onChanged!(value);
        });
      },
    );
  }

  Widget _isCenterTextFormField(bool isCenter, double width) {
    if (isCenter) {
      return Center(child: _textFormField(width));
    } else {
      return _textFormField(width);
    }
  }

  String? errorLabel() {
    if (widget.textController.text.isEmpty) {
      return widget.labelText;
    } else {
      return widget.errorLabel;
    }
  }

  Color borderColor(bool error) {
    if (widget.initialText != null) {
      return enableTextFiledColor;
    } else {
      if (error) {
        return primaryErrorColor;
      } else if (widget.textController.text.isEmpty) {
        return disableTextFiledColor;
      } else {
        return enableTextFiledColor;
      }
    }
  }
}
