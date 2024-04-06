import 'package:intl/intl.dart';

extension DoubleExt on double {
  String formatCurrency({
    String symbol = "Rp ",
    String locale = "id_ID",
    int decimalDigits = 0,
  }) {
    return NumberFormat.currency(
      symbol: symbol,
      locale: locale,
      decimalDigits: decimalDigits,
    ).format(this);
  }
}
