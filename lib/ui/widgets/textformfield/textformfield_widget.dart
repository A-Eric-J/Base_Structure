import 'package:base_structure_project/const_values/assets.dart';
import 'package:flutter/material.dart';
import 'package:base_structure_project/providers/authentication_provider.dart';
import 'package:base_structure_project/ui/shared/colors.dart';
import 'package:base_structure_project/ui/shared/regex.dart';
import 'package:base_structure_project/ui/shared/text.dart';
import 'package:base_structure_project/ui/shared/text_style.dart';
import 'package:provider/provider.dart';

/// [TextFormFieldWidget] is a custom widget of TextFormField widget that is using in your app
class TextFormFieldWidget extends StatelessWidget {
  final Function(bool)? error;
  final TextEditingController controller;
  final String labelText;
  final Widget? prefix;
  final void Function(String)? onChanged;
  final EdgeInsets? contentPadding;
  final int? maxLength;
  final int? maxLines;
  final String? initialText;
  final bool? enable;
  final Color? textColor;
  final double? textSize;

  const TextFormFieldWidget({
    Key? key,
    this.error,
    required this.controller,
    this.prefix,
    this.onChanged,
    this.contentPadding,
    this.maxLength,
    required this.labelText,
    this.maxLines,
    this.initialText,
    this.enable = true,
    this.textColor,
    this.textSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final node = FocusScope.of(context);
    var width = MediaQuery.of(context).size.width;
    return Consumer<AuthenticationLoginProvider>(
        builder: (context, authenticationProvider, child) {
      return TextFormField(
        controller: controller,
        initialValue: initialText,
        maxLines: maxLines,
        maxLength: maxLength,
        enabled: enable,
        textAlign: textAlign(labelText, controller),
        keyboardType: keyboardType(labelText),
        // obscureText: labelText == PasswordTextFiled ? true : false,
        textAlignVertical: TextAlignVertical.center,
        textInputAction: textInputAction(labelText),
        // onEditingComplete: () => node.nextFocus(),
        onFieldSubmitted: (value) {
          onSubmit(labelText, node);
        },
        style: robotoNormalStyle(((textSize ?? 18) / mainWidthSize) * width,
            textColor ?? primaryDark),
        decoration: InputDecoration(
            counterText: '',
            border: InputBorder.none,
            hintText: hintText(labelText),
            hintStyle:
                robotoNormalStyle((12 / mainWidthSize) * width, primaryGray),
            contentPadding: contentPadding ?? EdgeInsets.zero,
            prefix: prefix),
        cursorColor: enableTextFiledColor,
        onChanged: (value) {
          onChanged!(value);
          if (value.isNotEmpty && error != null) error!(false);
          if (labelText == codeReceiveLabelText) {
            if (numericRegExp.hasMatch(controller.text)) {
              node.nextFocus();
            }
          }
        },
        validator: (result) {
          if (result!.isEmpty) {
            if (labelText != emailLabelText) {
              error!(true);
            }
            return;
          } else if (result.isNotEmpty) {
            if (labelText == emailLabelText) {
              if (!emailCharactersRegExp.hasMatch(result)) {
                error!(true);
              }
            }
            if (labelText == nationalCodeLabelText) {
              if (controller.text.length < 10) {
                error!(true);
                return;
              }
            }
            error!(false);
          }
          return null;
        },
      );
    });
  }

  TextInputAction textInputAction(String label) {
    if ((label == addressTitleLabelText) ||
        (label == phoneNumberLabelText) ||
        (label == phoneNumberOrTelephoneLabelText) ||
        (label == descriptionLabelText) ||
        (label == referralCodeLabelText) ||
        (label == emailLabelText) ||
        (label == ticketMessageLabelText) ||
        (label == inviteCodeLabelText)) {
      return TextInputAction.done;
    } else {
      return TextInputAction.next;
    }
  }

  void onSubmit(String label, FocusNode node) {
    if ((label == addressTitleLabelText) ||
        (label == phoneNumberLabelText) ||
        (label == phoneNumberOrTelephoneLabelText) ||
        (label == referralCodeLabelText) ||
        (label == descriptionLabelText) ||
        (label == emailLabelText) ||
        (label == ticketMessageLabelText) ||
        (label == inviteCodeLabelText)) {
    } else {
      node.nextFocus();
    }
  }

  TextInputType keyboardType(String label) {
    switch (label) {
      case phoneNumberLabelText:
        return TextInputType.phone;
      case phoneNumberOrTelephoneLabelText:
        return TextInputType.phone;
      case codeReceiveLabelText:
        return TextInputType.number;
      case emailLabelText:
        return TextInputType.emailAddress;
      case referralCodeLabelText:
        return TextInputType.phone;
      case nationalCodeLabelText:
        return TextInputType.number;
    }
    return TextInputType.text;
  }

  String hintText(String labelText) {
    switch (labelText) {
      case phoneNumberLabelText:
        return phoneNumberHintText;
      case phoneNumberOrTelephoneLabelText:
        return phoneNumberOrTelephoneHintText;
      case descriptionLabelText:
        return descriptionHintText;
      case numberAddressLabelText:
        return numberAddressHintText;
      case unitAddressLabelText:
        return unitAddressHintText;
      case addressTitleLabelText:
        return addressTitleHintText;
      case firstNameLabelText:
        return firstNameHintText;
      case fullNameLabelText:
        return fullNameHintText;
      case lastNameLabelText:
        return lastNameHintText;
      case emailLabelText:
        return emailHintText;
      case ticketTitleLabelText:
        return ticketTitleHintText;
      case ticketMessageLabelText:
        return ticketMessageHintText;
      case codeReceiveLabelText:
        return '';
      case nationalCodeLabelText:
        return nationalCodeHintText;
    }
    return labelText;
  }

  /// it depends on your rtl or ltr language
  TextAlign textAlign(String labelText, TextEditingController controller) {
    /// for RTL languages
    // if ((labelText == phoneNumberLabelText) ||
    //     (labelText == phoneNumberOrTelephoneLabelText) ||
    //     (labelText == emailLabelText) ||
    //     (labelText == referralCodeLabelText) ||
    //     (labelText == nationalCodeLabelText)) {
    //   return controller.text.isEmpty ? TextAlign.right : TextAlign.left;
    // } else if (labelText == codeReceiveLabelText) {
    //   return TextAlign.center;
    // } else if (labelText == inviteCodeLabelText) {
    //   return TextAlign.center;
    // } else {
    //   return TextAlign.right;
    // }

    /// for LTR languages
    if ((labelText == phoneNumberLabelText) ||
        (labelText == phoneNumberOrTelephoneLabelText) ||
        (labelText == emailLabelText) ||
        (labelText == referralCodeLabelText) ||
        (labelText == nationalCodeLabelText)) {
      return TextAlign.left;
    } else if (labelText == codeReceiveLabelText) {
      return TextAlign.center;
    } else if (labelText == inviteCodeLabelText) {
      return TextAlign.center;
    } else {
      return TextAlign.left;
    }
  }
}
