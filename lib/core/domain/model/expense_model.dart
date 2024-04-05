class ExpenseModel {
  final int? id;
  final String name;
  final String category;
  final double amount;
  final DateTime expensedAt;

  ExpenseModel({
    this.id,
    required this.name,
    required this.category,
    required this.amount,
    required this.expensedAt,
  });

  factory ExpenseModel.fromJson(Map<String, dynamic> json) => ExpenseModel(
        name: json['name'],
        category: json['category'],
        amount: json['amount'],
        expensedAt: json['expensed_at'],
      );
}
