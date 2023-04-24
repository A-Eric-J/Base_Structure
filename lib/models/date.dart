import 'package:intl/intl.dart';

/// [Date] model
class Date {
  DateTime? date;

  Date.convertMsToDateString(int millisecond) {
    date = DateTime.fromMillisecondsSinceEpoch(millisecond);
  }

  int convertDateTimeToMs(Date dateTime) {
    return dateTime.date!.millisecondsSinceEpoch;
  }

  int convertDateStringToMs(String dateString) {
    DateFormat dateFormat = DateFormat("yyyy/mm/dd");
    var millisecond = dateFormat.parse(dateString).millisecondsSinceEpoch;
    return millisecond;
  }
}
