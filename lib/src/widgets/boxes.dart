import 'dart:io';

import 'package:daily_tool/src/models/expense_model.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class Boxes {
  static Box<ExpenseModel> getExpenses() => Hive.box('expenseBox');

  // Future<void> backupHiveBox(String boxName) async {
  //   final directory = await getApplicationDocumentsDirectory();
  //   final box = await Hive
  //     ..boxExists(boxName);
  //   final boxPath = box.path;
  //   await box.close();

  //   try {
  //     File(boxPath!).copy(directory.path);
  //     print(directory.path);
  //   } finally {
  //     await Hive.openBox(boxName);
  //   }
  // }
}
