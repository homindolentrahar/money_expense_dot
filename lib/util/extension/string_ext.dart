extension StringExt on String {
  double get currencyInput =>
      double.tryParse(split("Rp ").last.replaceAll(".", "")) ?? 0;
}
