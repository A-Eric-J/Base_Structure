import 'package:flutter/material.dart';
import 'package:base_structure_project/ui/extensions/help_methods.dart';
import 'package:base_structure_project/ui/shared/regex.dart';

/// [MaskedTextController] is a text controller that makes you handle the textFormField easily
class MaskedTextController extends TextEditingController {
  MaskedTextController(
      {String? text,
      required this.mask,
      Map<String, RegExp>? translator,
      this.length = 0})
      : super(text: text) {
    this.translator = translator ?? MaskedTextController.getDefaultTranslator();

    addListener(() {
      var previous = _lastUpdatedText;
      if (beforeChange(previous, this.text)) {
        updateText(this.text, length);
        afterChange(previous, this.text);
      } else {
        updateText(_lastUpdatedText, length);
      }
    });

    updateText(this.text, length);
  }

  String mask;
  int length;
  Map<String, RegExp>? translator;

  Function afterChange = (String previous, String next) {};
  Function beforeChange = (String previous, String next) {
    return true;
  };

  String _lastUpdatedText = '';

  void updateText(String? text, int length) {
    if (text != null) {
      this.text = _applyMask(mask, text, length);
    } else {
      this.text = '';
    }

    _lastUpdatedText = this.text;
  }

  void updateMask(String mask, {bool moveCursorToEnd = true}) {
    this.mask = mask;
    updateText(text, length);

    if (moveCursorToEnd) {
      this.moveCursorToEnd();
    }
  }

  void moveCursorToEnd() {
    var text = _lastUpdatedText;
    selection = TextSelection.fromPosition(TextPosition(offset: (text).length));
  }

  @override
  set text(String newText) {
    if (super.text != newText) {
      super.text = newText;
      moveCursorToEnd();
    }
  }

  static Map<String, RegExp> getDefaultTranslator() {
    return {
      'A': alphabetCharactersRegExp,
      '0': numericRegExp,
      '@': alphabetAndNumericRegExp,
      '*': allCharactersRegExp,
      'P': priceCharactersRegExp,
    };
  }

  String _applyMask(String mask, String value, int length) {
    String result = '';
    var maskCharIndex = 0;
    var valueCharIndex = 0;
    var maskLength = length;
    if (length == 0) {
      maskLength = mask.length;
    }

    while (true) {
      // if mask is ended, break.
      if (maskCharIndex == maskLength) {
        break;
      }

      // if value is ended, break.
      if (valueCharIndex == value.length) {
        break;
      }
      var maskChar = length == 0 ? mask[maskCharIndex] : mask;
      var valueChar = value[valueCharIndex];

      // value equals mask, just set
      if (maskChar == valueChar) {
        result += maskChar;
        valueCharIndex += 1;
        maskCharIndex += 1;
        continue;
      }

      // apply translator if match
      if (translator!.containsKey(maskChar)) {
        if (translator![maskChar]!.hasMatch(valueChar)) {
          result += valueChar;
          maskCharIndex += 1;
        }

        valueCharIndex += 1;
        continue;
      }

      // not masked value, fixed char on mask
      result += maskChar;
      maskCharIndex += 1;
      continue;
    }

    return convertEnglishNumberToPersianNumber(result);
  }
}
