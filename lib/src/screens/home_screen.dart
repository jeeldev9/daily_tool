import 'package:daily_tool/src/constant_variables.dart';
import 'package:daily_tool/src/models/expense_model.dart';
import 'package:daily_tool/src/widgets/dialog.dart';
import 'package:daily_tool/src/widgets/expense_tile.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  double totalExpense = 0.0;

  @override
  void initState() {
    for (var i in expenseDataList) {
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
                        onPressed: () async{
                          bool result=await  showDialog(
                            barrierDismissible: false,
                              context: context,
                              builder: (context) => DialogFb1());
                          if(result){
                            totalExpense=0.0;
                            for (var i in expenseDataList) {
                              totalExpense += i.amount!;
                            }
                            setState(() {

                            });
                          }
                        },
                        child: const Text("Add Entry")),
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
                      var temp = expenseDataList[oldIndex];
                      expenseDataList[oldIndex] = expenseDataList[newIndex];
                      expenseDataList[newIndex] = temp;
                      expenseDataList[oldIndex].no = (oldIndex + 1).toString();
                      expenseDataList[newIndex].no = (newIndex + 1).toString();
                    },
                    itemCount: expenseDataList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ExpensTile(
                        key: ValueKey(index),
                        expenseModel: expenseDataList[index],
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
