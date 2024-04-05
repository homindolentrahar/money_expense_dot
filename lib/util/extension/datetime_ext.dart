import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  String formatDate({String pattern = "dd MMMM yyyy"}) =>
      DateFormat(pattern).format(this);

  bool get isToday {
    final current = DateTime.now();

    return current.day == day && current.month == month && current.year == year;
  }

  bool get isYesterday {
    final current = DateTime.now();

    return current.subtract(const Duration(days: 1)).day == day &&
        current.month == month &&
        current.year == year;
  }
}
