import 'package:daily_tool/src/constant_variables.dart';
import 'package:daily_tool/src/models/expense_model.dart';
import 'package:daily_tool/src/widgets/boxes.dart';
import 'package:daily_tool/src/widgets/dialog.dart';
import 'package:daily_tool/src/widgets/expense_tile.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double totalExpense = 0.0;
  storeList() {
    expenseDataList = Boxes.getExpenses().values.toList();
    print(expenseDataList);
    for (var i in expenseDataList) {
      totalExpense += i.amount!;
    }
  }

  @override
  void initState() {
    storeList();
  }

  @override
  void dispose() {
    Hive.box('expenseBox').close();
    super.dispose();
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
                  ElevatedButton(
                      onPressed: () async {
                        // await Boxes().backupHiveBox('expenseBox');
                      },
                      child: Text('Backup')),
                  Padding(
                    padding: const EdgeInsets.only(right: 10.0),
                    child: ElevatedButton(
                        onPressed: () async {
                          bool result = await showDialog(
                              barrierDismissible: false,
                              context: context,
                              builder: (context) => DialogFb1());
                          if (result) {
                            totalExpense = 0.0;
                            storeList();
                            setState(() {});
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
                  child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: expenseDataList.length + 1,
                    itemBuilder: (BuildContext context, int index) {
                      return index == 0
                          ? Column(
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
                            )
                          : ExpensTile(
                              expenseModel: expenseDataList[index - 1],
                              isTopBorder: index == 1 ? true : false,
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
