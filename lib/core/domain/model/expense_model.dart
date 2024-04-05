class ExpenseModel {
  final int id;
  final String name;
  final String category;
  final double amount;
  final DateTime expensedAt;

  ExpenseModel({
    required this.id,
    required this.name,
    required this.category,
    required this.amount,
    required this.expensedAt,
  });
}
