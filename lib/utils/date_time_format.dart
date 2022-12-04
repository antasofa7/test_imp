import 'package:intl/intl.dart';

class DateTimeFormat {
  static String format(date) {
    final dayFormat = DateFormat.d('id_ID').format(date);
    String day;
    if (dayFormat.length == 2) {
      day = dayFormat;
    } else {
      day = '0$dayFormat';
    }
    final dateFormat = DateFormat.yMMMM('id_ID').format(date);
    final timeFormat = DateFormat('HH:m:s').format(date);

    return '$day $dateFormat, $timeFormat';
  }
}
