import 'package:daily_tool/src/models/expense_model.dart';
import 'package:daily_tool/src/widgets/boxes.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constant_variables.dart';

class DialogFb1 extends StatefulWidget {
  DialogFb1({Key? key}) : super(key: key);

  @override
  State<DialogFb1> createState() => _DialogFb1State();
}

class _DialogFb1State extends State<DialogFb1> {
  final primaryColor = const Color(0xff4338CA);

  final accentColor = const Color(0xffffffff);

  final TextEditingController expenseController = TextEditingController();

  final TextEditingController amountController = TextEditingController();
  String selectedDate = "";

  List<String> category = [
    'Food',
    'Entertainment',
    'Education',
    'Transportation'
  ];

  String selectedCategory = '';
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return Dialog(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15.0),
                boxShadow: [
                  BoxShadow(
                      offset: const Offset(12, 26),
                      blurRadius: 50,
                      spreadRadius: 0,
                      color: Colors.grey.withOpacity(.1)),
                ]),
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: const [
                      CircleAvatar(
                        child: Icon(Icons.edit),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "Add New Entry",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                  SizedBox(
                    height: h * 0.03,
                  ),
                  TextField(
                    controller: expenseController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Expense',
                      hintText: 'Ex. xyz',
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  TextField(
                    controller: amountController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Amount',
                      hintText: 'Ex. 10000',
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Container(
                    width: w,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(4)),
                    child: DropdownButton<String>(
                      value: selectedCategory == '' ? null : selectedCategory,
                      hint: const Text("Select Category"),
                      underline: Container(),
                      items: category.map((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedCategory = value!;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  GestureDetector(
                    onTap: () async {
                      final DateTime? newDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2017, 1),
                        lastDate: DateTime(2022, 7),
                        helpText: 'Select a date',
                      );
                      setState(() {
                        selectedDate =
                            DateFormat.yMMMMd().format(newDate!).toString();
                      });
                      print("Select Date");
                    },
                    child: TextField(
                      enabled: false,
                      decoration: InputDecoration(
                          border: const OutlineInputBorder(),
                          labelText:
                              selectedDate == "" ? 'Select Date' : selectedDate,
                          prefixIcon: const Icon(Icons.calendar_today)),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SimpleBtn1(
                        text: "Cancel",
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                        invertedColors: true,
                      ),
                      SimpleBtn1(
                          text: "Add",
                          onPressed: () {
                            final box = Boxes.getExpenses();
                            box.add(ExpenseModel(
                                no: (expenseDataList.length + 1).toString(),
                                expense: expenseController.text,
                                category: selectedCategory,
                                date: selectedDate,
                                amount: double.parse(amountController.text)));

                            Navigator.pop(context, true);
                          }),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class SimpleBtn1 extends StatelessWidget {
  final String text;
  final Function() onPressed;
  final bool invertedColors;

  const SimpleBtn1(
      {required this.text,
      required this.onPressed,
      this.invertedColors = false,
      Key? key})
      : super(key: key);
  final primaryColor = const Color(0xff4338CA);
  final accentColor = const Color(0xffffffff);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(0),
            alignment: Alignment.center,
            side: MaterialStateProperty.all(
                BorderSide(width: 1, color: primaryColor)),
            padding: MaterialStateProperty.all(
                const EdgeInsets.only(right: 25, left: 25, top: 0, bottom: 0)),
            backgroundColor: MaterialStateProperty.all(
                invertedColors ? accentColor : primaryColor),
            shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            )),
        onPressed: onPressed,
        child: Text(
          text,
          style: TextStyle(
              color: invertedColors ? primaryColor : accentColor, fontSize: 16),
        ));
  }
}
