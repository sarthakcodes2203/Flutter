import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  DateTime get dateOnly {
    return DateTime(year, month, day);
  }

  String get todaysDate {
    return DateFormat.yMMMMd().format(this);
  }
}
