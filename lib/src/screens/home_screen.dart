import 'package:daily_tool/src/models/expense_model.dart';
import 'package:daily_tool/src/widgets/expense_tile.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<ExpenseModel> data = [
    ExpenseModel(
        no: "1",
        expense: "Pizza",
        category: "Food",
        date: "January 1,2022",
        amount: 900),
    ExpenseModel(
        no: "2",
        expense: "College Fees",
        category: "Education",
        date: "January 4,2022",
        amount: 20000),
    ExpenseModel(
        no: "3",
        expense: "Breakfast",
        category: "Food",
        date: "January 5,2022",
        amount: 200),
    ExpenseModel(
        no: "4",
        expense: "Netflix",
        category: "Entertainment",
        date: "March 3,2022",
        amount: 600),
  ];

  double totalExpense = 0.0;

  @override
  void initState() {
    for (var i in data) {
      totalExpense += i.amount!;
    }
  }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Screen"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Total Expenses:- $totalExpense"),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: ElevatedButton(
                        onPressed: () {}, child: const Text("Add Entry")),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  width: w * 1.6,
                  child: ReorderableListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    header: Column(
                      children: [
                        ExpensTile(
                          isHeader: true,
                          isAmountTextAlignRight: false,
                          isBorder: false,
                        ),
                        const SizedBox(
                          height: 10,
                        )
                      ],
                    ),
                    shrinkWrap: true,
                    onReorder: (oldIndex, newIndex) {
                      if (newIndex > oldIndex) {
                        newIndex -= 1;
                      }
                      var temp = data[oldIndex];
                      data[oldIndex] = data[newIndex];
                      data[newIndex] = temp;
                      data[oldIndex].no = (oldIndex + 1).toString();
                      data[newIndex].no = (newIndex + 1).toString();
                    },
                    itemCount: data.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ExpensTile(
                        key: ValueKey(index),
                        expenseModel: data[index],
                        isTopBorder: index == 0 ? true : false,
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(
                height: 90,
              )
            ],
          ),
        ),
      ),
    );
  }
}
