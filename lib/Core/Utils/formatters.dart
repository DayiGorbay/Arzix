import 'package:intl/intl.dart';

String getPersianNumbers (String number) {

  const en = ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9'];
  const fa = ['۰', '۱', '۲', '۳', '۴', '۵', '۶', '۷', '۸', '۹'];

  for (int i = 0; i < en.length; i++) {
    
    number = number.replaceAll(en[i], fa[i]);

  }

  return number;

}

String formatNumber(num number) {

  final formatter = NumberFormat("#,###", "fa_IR");

  String formatted = formatter.format(number.abs());

  formatted = getPersianNumbers(formatted);

  if (number < 0) {
    return "\u200E-$formatted";
  }

  return formatted;

}

String formatChangePercent(num number, {int decimalDigits = 2,}) {

  final formatter = NumberFormat(
    "#,##0.${'0' * decimalDigits}",
    "fa_IR",
  );

  String formatted = formatter.format(number.abs());

  formatted = getPersianNumbers(formatted);

  if (number < 0) {
    return "\u200E-$formatted";
  }

  return formatted;

}