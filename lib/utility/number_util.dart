
import 'package:intl/intl.dart';

final oCcy = new NumberFormat("#,##0.00", "id");

String formatNumber(double number){
  String s = oCcy.format(number);
  s = s.endsWith('00') ? s.substring(0, s.length - 3) : s;
  return "Rp $s";
}