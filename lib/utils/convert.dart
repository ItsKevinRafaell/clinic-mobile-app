import 'package:intl/intl.dart';

class Convert {
  static String formatToReadableDate(String dateTimeString) {
    DateTime parsedDate =
        DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateTimeString);
    return DateFormat("dd MMM yyyy").format(parsedDate);
  }

  static String formatToReadableTime(String dateTimeString) {
    DateTime parsedDate =
        DateFormat("yyyy-MM-dd HH:mm:ss").parse(dateTimeString);
    return DateFormat("HH::mm").format(parsedDate);
  }
}
