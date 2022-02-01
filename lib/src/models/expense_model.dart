class ExpenseModel {
  String? no;
  String? expense;
  double? amount;
  String? category;
  String? date;

  ExpenseModel({
    required this.no,
    this.expense = "",
    this.amount = 0.0,
    this.category = "",
    this.date = "",
  });
}
