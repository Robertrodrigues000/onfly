import 'package:flutter/material.dart';
import 'package:onfly/domain/entitites/expenses_entity.dart';

class HomeController extends ChangeNotifier {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final expensesListListenable = ValueNotifier<List<ExpenseEntity>>(
    [
      ExpenseEntity(
        day: DateTime.now(),
        description: "Almoço",
        value: 1.00,
      ),
      ExpenseEntity(
        day: DateTime.now(),
        description: "Casa",
        value: 5.00,
      ),
      ExpenseEntity(
        day: DateTime.now(),
        description: "Avião",
        value: 15.00,
      ),
      ExpenseEntity(
        day: DateTime.now(),
        description: "Almoço",
        value: 50.00,
      ),
    ],
  );

  double getTotalExpense() {
    double finalResult = 0;
    expensesListListenable.value.forEach((element) {
      finalResult += element.value;
    });
    return finalResult;
  }

  void addExpense({required ExpenseEntity expense}) async {
    expensesListListenable.value.add(expense);
    expensesListListenable.notifyListeners();
  }
}
