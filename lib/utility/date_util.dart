import 'package:intl/intl.dart';

String getTodayDateFormat() {
  DateTime now = DateTime.now();
  return DateFormat("yyyy-MM-dd").format(now);
}

String getYesterdayDateFormat() {
  DateTime yesterday = DateTime.now().subtract(Duration(days: 1));
  return DateFormat("yyyy-MM-dd").format(yesterday);
}

String getLastMonthDateFormat() {
  DateTime yesterday = DateTime.now().subtract(Duration(days: 30));
  return DateFormat("yyyy-MM-dd").format(yesterday);
}

String convertToViewFormat(String yyyyMMdd) {
  return DateFormat("EEEE, dd MMMM yyyy", "id").format(DateFormat("yyyy-MM-dd").parse(yyyyMMdd));
}

DateTime toDateTime(String dateString, String format, {bool utc = true}) {
  return DateFormat(format).parse(dateString, utc);
}

int minutesBetween(DateTime from, DateTime to) {
  return (to.difference(from).inSeconds / 60).round();
}
