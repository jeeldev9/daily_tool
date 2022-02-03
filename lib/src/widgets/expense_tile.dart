import 'package:daily_tool/src/models/expense_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ExpensTile extends StatelessWidget {
  ExpenseModel? expenseModel;
  bool? isAmountTextAlignRight;
  bool? isHeader;
  bool? isBorder;
  bool? isTopBorder;
  ExpensTile(
      {Key? key,
      this.expenseModel,
      this.isAmountTextAlignRight = true,
      this.isBorder = true,
      this.isHeader = false,
      this.isTopBorder = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
              border: isBorder!
                  ? Border(
                      bottom: const BorderSide(
                        color: Colors.grey,
                      ),
                      right: const BorderSide(
                        color: Colors.grey,
                      ),
                      top: isTopBorder!
                          ? const BorderSide(
                              color: Colors.grey,
                            )
                          : const BorderSide(
                              color: Colors.transparent,
                            ),
                    )
                  : null),
          padding:
              EdgeInsets.symmetric(horizontal: 5, vertical: isBorder! ? 8 : 0),
          width: 30,
          child: Text("${isHeader! ? "No" : expenseModel!.no}"),
        ),
        Container(
          decoration: BoxDecoration(
              border: isBorder!
                  ? Border(
                      bottom: const BorderSide(
                        color: Colors.grey,
                      ),
                      right: const BorderSide(
                        color: Colors.grey,
                      ),
                      top: isTopBorder!
                          ? const BorderSide(
                              color: Colors.grey,
                            )
                          : const BorderSide(
                              color: Colors.transparent,
                            ),
                    )
                  : null),
          padding:
              EdgeInsets.symmetric(horizontal: 5, vertical: isBorder! ? 8 : 0),
          width: w * 0.5,
          child: Text("${isHeader! ? "Expense" : expenseModel!.expense}"),
        ),
        Container(
          decoration: BoxDecoration(
              border: isBorder!
                  ? Border(
                      bottom: const BorderSide(
                        color: Colors.grey,
                      ),
                      right: const BorderSide(
                        color: Colors.grey,
                      ),
                      top: isTopBorder!
                          ? const BorderSide(
                              color: Colors.grey,
                            )
                          : const BorderSide(
                              color: Colors.transparent,
                            ),
                    )
                  : null),
          padding:
              EdgeInsets.symmetric(horizontal: 5, vertical: isBorder! ? 8 : 0),
          width: w * 0.2,
          child: Text(
            "${isHeader! ? "Amount" : expenseModel!.amount}",
            textAlign:
                isAmountTextAlignRight! ? TextAlign.right : TextAlign.left,
          ),
        ),
        Container(
          decoration: BoxDecoration(
              border: isBorder!
                  ? Border(
                      bottom: const BorderSide(
                        color: Colors.grey,
                      ),
                      right: const BorderSide(
                        color: Colors.grey,
                      ),
                      top: isTopBorder!
                          ? const BorderSide(
                              color: Colors.grey,
                            )
                          : const BorderSide(
                              color: Colors.transparent,
                            ),
                    )
                  : null),
          padding:
              EdgeInsets.symmetric(horizontal: 5, vertical: isBorder! ? 8 : 0),
          width: w * 0.3,
          child: Text("${isHeader! ? "Category" : expenseModel!.category}"),
        ),
        Container(
          decoration: BoxDecoration(
              border: isBorder!
                  ? Border(
                      bottom: const BorderSide(
                        color: Colors.grey,
                      ),
                      right: const BorderSide(
                        color: Colors.grey,
                      ),
                      top: isTopBorder!
                          ? const BorderSide(
                              color: Colors.grey,
                            )
                          : const BorderSide(
                              color: Colors.transparent,
                            ),
                    )
                  : null),
          padding:
              EdgeInsets.symmetric(horizontal: 5, vertical: isBorder! ? 8 : 0),
          width: w * 0.37,
          child: Text("${isHeader! ? "Date" : expenseModel!.date}"),
        ),
      ],
    );
  }
}
