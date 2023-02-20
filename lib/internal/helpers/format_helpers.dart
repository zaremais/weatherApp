import 'package:intl/intl.dart';

getDateFormat(int date) {
  var dt = DateTime.fromMillisecondsSinceEpoch(date * 1000);
  return DateFormat('d MMMM yyyy').format(dt);
}

getTimeFormat(int time) {
  var tm = DateTime.fromMillisecondsSinceEpoch(time * 1000);
  return DateFormat('HH:mm:ss').format(tm);
}

getCelcFormat(double temp) {
  var celc2 = 273.15;
  var res = temp - celc2;
  return res.toInt();
}
