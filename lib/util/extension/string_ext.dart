extension StringExt on String {
  double get currencyInput => double.tryParse(split("Rp. ").last) ?? 0;
}
