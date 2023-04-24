import 'package:base_structure_project/const_values/assets.dart';
import 'package:base_structure_project/ui/shared/colors.dart';
import 'package:base_structure_project/ui/shared/regex.dart';
import 'package:base_structure_project/ui/shared/text.dart';
import 'package:base_structure_project/ui/widgets/text/text_view.dart';
import 'package:flutter/material.dart';

/// help_methods contains methods that are helping us (it's like a toolbox Lol;) ) in Ui and Services

/// this method is for preCaching local images
void preCacheImages(BuildContext context) {
  precacheImage(const AssetImage(Assets.logo), context);
  precacheImage(const AssetImage(Assets.firstOnBoardingPage), context);
  precacheImage(const AssetImage(Assets.secondOnBoardingPage), context);
  precacheImage(const AssetImage(Assets.thirdOnBoardingPage), context);
  precacheImage(const AssetImage(Assets.defaultHero), context);
  precacheImage(const AssetImage(Assets.placeHolder), context);
  precacheImage(const AssetImage(Assets.rotation), context);

  /// you can add images here
}

/// priceWithComma is designed for separating 3 digits by 3 digits
/// and for persian people if they need rial text the can set [withRialText] true
/// or if you need another money texts or signs you can add instead
String priceWithComma(String price,
    {bool withRialText = false,
    bool negativeSign = false,
    bool positiveSign = false}) {
  var negative = price.contains('-');
  var text = price.replaceAll(allCharactersExpectNumbersRegExp, '');
  text = text.replaceAll('،', '');
  text = String.fromCharCodes(text.runes.toList().reversed);
  List<String> rev = text.split('');
  var res = '';
  int lastIndex = 0;
  for (int i = 0; i < rev.length; i++) {
    if (i != 0 && i % 3 == 0) {
      res += rev.sublist(lastIndex, lastIndex + 3).join('');
      res += '،';
      lastIndex = i;
    }
    if (i == rev.length - 1) {
      res += rev.sublist(lastIndex).join('');
    }
  }

  res = String.fromCharCodes(res.runes.toList().reversed);
  if (positiveSign) {
    res = '$res+';
  }
  if (negativeSign) {
    res = '$res-';
  }
  if (withRialText) {
    res = '$res $rialText';
  }
  if (negative) {
    res = '-$res';
  }
  return res;
}

/// you can use the snackBar as well
void snackBar(String text, context,
    {GlobalKey<ScaffoldMessengerState>? scaffoldMessengerKey, Color? color}) {
  if (scaffoldMessengerKey != null) {
    scaffoldMessengerKey.currentState!.showSnackBar(SnackBar(
      duration: const Duration(milliseconds: 1500),
      content: TextView(
        text: text,
        color: color ?? white,
        size: 12,
      ),
    ));
  } else {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      duration: const Duration(milliseconds: 1500),
      content: TextView(
        text: text,
        color: color ?? white,
        size: 12,
      ),
    ));
  }
}

/// these 2 functions [convertEnglishNumberToPersianNumber] and [convertPersianNumberToEnglishNumber]
/// are for converting English numbers to persian. you can add your own format numbers here
String convertEnglishNumberToPersianNumber(String number) {
  var english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  var persian = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];
  for (var i = 0; i < english.length; i++) {
    number = number.replaceAll(english[i], persian[i]);
  }
  return number;
}

String convertPersianNumberToEnglishNumber(String number) {
  var english = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  var persian = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];
  for (var i = 0; i < persian.length; i++) {
    number = number.replaceAll(persian[i], english[i]);
  }
  return number;
}

/// this function is for converting numbers to any phone formatted that you want
String convertNumberToPhoneFormat(String phoneNumber) {
  if (phoneNumber[0] == '0') phoneNumber = phoneNumber.substring(1);
  return phoneNumber.replaceAllMapped(
      phoneFormatExp, (Match m) => "+98 ${m[1]} ${m[2]} ${m[3]}");
}

/// this function is for converting persian numbers to persian words,
String convertNumberToPersianWord(int number, {bool isPrice = false}) {
  var result = <String>[];

  while (number > 0) {
    result.add(_numToWord(number % base));
    number = (number / base).floor();
  }
  if (result.length > 4) return '';

  for (var i = 0; i < result.length; i++) {
    if (result[i] != '' && i != 0) result[i] += ' ${scale[i]} و ';
  }
  result = result.reversed.toList();

  var words = result.join('');

  if (words.endsWith(endsWithAnd)) {
    words = words.substring(0, (words.length - 3));
  }

  words = trim(words);

  return isPrice ? ('$words $rialText') : words;
}

String trim(String string) => string.replaceAll(whiteSpaceRegExp, '');

String _numToWord(int number) {
  var unit = 100;
  var result = '';

  while (unit > 0) {
    if ((number / unit).floor() * unit != 0) {
      if (numberToWord.containsKey(number)) {
        result += numberToWord[number]!;
        break;
      } else {
        result += '${numberToWord[(number / unit).floor() * unit]} و ';
        number %= unit;
      }
    }
    unit = (unit / 10).floor();
  }
  return result;
}

const base = 1000;

const zeroFa = 'صفر';

const endsWithAnd = ' و ';

const scale = ['', 'هزار', 'میلیون', 'میلیارد'];

const numberToWord = {
  0: '',
  1: 'یک',
  2: 'دو',
  3: 'سه',
  4: 'چهار',
  5: 'پنج',
  6: 'شش',
  7: 'هفت',
  8: 'هشت',
  9: 'نه',
  10: 'ده',
  11: 'یازده',
  12: 'دوازده',
  13: 'سیزده',
  14: 'چهارده',
  15: 'پانزده',
  16: 'شانزده',
  17: 'هفده',
  18: 'هجده',
  19: 'نوزده',
  20: 'بیست',
  30: 'سی',
  40: 'چهل',
  50: 'پنجاه',
  60: 'شصت',
  70: 'هفتاد',
  80: 'هشتاد',
  90: 'نود',
  100: 'صد',
  200: 'دویست',
  300: 'سیصد',
  400: 'چهارصد',
  500: 'پانصد',
  600: 'ششصد',
  700: 'هفتصد',
  800: 'هشتصد',
  900: 'نهصد',
};
