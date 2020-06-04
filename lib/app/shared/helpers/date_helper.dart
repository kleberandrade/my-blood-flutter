import 'package:intl/intl.dart';

class DateHelper {
  static final _format = DateFormat('dd/MM/yyyy');

  static String format(DateTime date) {
    return _format.format(date);
  }

  static DateTime parse(String dateString) {
    final date = _format.parse(dateString);
    return DateTime(date.year, date.month, date.day);
  }
}
