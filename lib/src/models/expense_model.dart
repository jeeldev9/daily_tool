import 'package:hive/hive.dart';
part 'expense_model.g.dart';

@HiveType(typeId: 0)
class ExpenseModel extends HiveObject {
  @HiveField(0)
  String? no;
  @HiveField(1)
  String? expense;
  @HiveField(3)
  double? amount;
  @HiveField(4)
  String? category;
  @HiveField(5)
  String? date;

  ExpenseModel({
    required this.no,
    this.expense = "",
    this.amount = 0.0,
    this.category = "",
    this.date = "",
  });
}
