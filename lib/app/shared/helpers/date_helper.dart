import 'package:intl/intl.dart';

class DateHelper {
  static final _format = DateFormat('dd/MM/yyyy');

  static String format(DateTime date) {
    return _format.format(date);
  }
}
