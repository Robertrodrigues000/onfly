import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:onfly/domain/entitites/expenses_entity.dart';

import '../../../domain/usecases/add_expense_usecase.dart';
import '../../../domain/usecases/delete_expense_usecase.dart';
import '../../../domain/usecases/get_expense_list_usecase.dart';
import '../../widgets/snackbar_widget.dart';

class HomeController extends ChangeNotifier {
  final _addExpenseUsecase = Modular.get<AddExpenseUsecase>();
  final _deleteExpenseUsecase = Modular.get<DeleteExpenseUsecase>();
  final _getExpenseListUsecase = Modular.get<GetExpenseListUsecase>();

  HomeController() {
    _getExpenseList();
  }

  final scaffoldKey = GlobalKey<ScaffoldState>();
  final expensesListListenable = ValueNotifier<List<ExpenseEntity>>([]);

  Future<void> _getExpenseList() async {
    var response = await _getExpenseListUsecase();

    if (response.isRight) {
      expensesListListenable.value = response.right;
      expensesListListenable.notifyListeners();
    } else {
      SnackbarHelper.error(
        message:
            'Erro ao carregar as informações, favor tentar novamente mais tarde.',
        context: scaffoldKey.currentContext!,
      );
    }
  }

  double getTotalExpense() {
    double finalResult = 0;
    expensesListListenable.value.forEach((element) {
      finalResult += element.amount;
    });
    return finalResult;
  }

  Future<void> addExpense({required ExpenseEntity expense}) async {
    var response = await _addExpenseUsecase(expense: expense);

    if (response.isRight) {
      expensesListListenable.value.add(expense);
      expensesListListenable.notifyListeners();
    } else {
      SnackbarHelper.error(
        message:
            'Erro ao carregar as informações, favor tentar novamente mais tarde.',
        context: scaffoldKey.currentContext!,
      );
    }
  }

  void onDeleteExpense({required ExpenseEntity expense}) async {
    var response = await _deleteExpenseUsecase(expense: expense);

    if (response.isRight) {
      expensesListListenable.value.remove(expense);
      expensesListListenable.notifyListeners();
    } else {
      SnackbarHelper.error(
        message:
            'Erro ao carregar as informações, favor tentar novamente mais tarde.',
        context: scaffoldKey.currentContext!,
      );
    }
  }
}
