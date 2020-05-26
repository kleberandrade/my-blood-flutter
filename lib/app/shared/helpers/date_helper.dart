import 'package:intl/intl.dart';

class DateHelper {
  static final _format = DateFormat('dd/MM/yyyy');

  static String format(DateTime date) {
    return _format.format(date);
  }

  static DateTime parse(String dateString) {
    return _format.parse(dateString);
  }
}
