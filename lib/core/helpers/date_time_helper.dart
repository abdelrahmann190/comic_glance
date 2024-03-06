import 'package:intl/intl.dart';

class DateTimeHelper {
  static String formateYMD(String dateString) {
    final dateTime = DateTime.parse(dateString);

    return DateFormat('dd / MMMM / yy').format(dateTime);
  }
}
