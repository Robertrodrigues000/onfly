import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:onfly/domain/entitites/expenses_entity.dart';

import '../../../domain/usecases/add_expense_usecase.dart';

class HomeController extends ChangeNotifier {
  final _addExpenseUsecase = Modular.get<AddExpenseUsecase>();

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final expensesListListenable = ValueNotifier<List<ExpenseEntity>>(
    [
      ExpenseEntity(
        day: DateTime.now(),
        description: "Almoço",
        amount: 1.00,
      ),
      ExpenseEntity(
        day: DateTime.now(),
        description: "Casa",
        amount: 5.00,
      ),
      ExpenseEntity(
        day: DateTime.now(),
        description: "Avião",
        amount: 15.00,
      ),
      ExpenseEntity(
        day: DateTime.now(),
        description: "Almoço",
        amount: 50.00,
      ),
    ],
  );

  double getTotalExpense() {
    double finalResult = 0;
    expensesListListenable.value.forEach((element) {
      finalResult += element.amount;
    });
    return finalResult;
  }

  Future<void> addExpense({required ExpenseEntity expense}) async {
    await _addExpenseUsecase(expense: expense);
    expensesListListenable.value.add(expense);

    expensesListListenable.notifyListeners();
  }

  void onDeleteExpense({required ExpenseEntity expense}) async {
    expensesListListenable.value.remove(expense);
    expensesListListenable.notifyListeners();
  }
}
