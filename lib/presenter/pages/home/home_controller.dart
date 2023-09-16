import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:onfly/domain/entitites/expenses_entity.dart';

import '../../../domain/usecases/add_expense_usecase.dart';
import '../../../domain/usecases/delete_expense_usecase.dart';
import '../../../domain/usecases/edit_expense_usecase.dart';
import '../../../domain/usecases/get_expense_list_usecase.dart';
import '../../widgets/snackbar_widget.dart';

class HomeController extends ChangeNotifier {
  final _addExpenseUsecase = Modular.get<AddExpenseUsecase>();
  final _editExpenseUsecase = Modular.get<EditExpenseUsecase>();
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
    if (expense.id != null) {
      var response = await _editExpenseUsecase(expense: expense);

      if (response.isRight) {
        for (var i = 0; i < expensesListListenable.value.length; i++) {
          if (expensesListListenable.value[i].id == expense.id) {
            expensesListListenable.value[i] = expense;
          }
          ;
        }
        expensesListListenable.notifyListeners();
      } else {
        SnackbarHelper.error(
          message:
              'Erro ao carregar as informações, favor tentar novamente mais tarde.',
          context: scaffoldKey.currentContext!,
        );
      }
    } else {
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
  }

  Future<void> onDeleteExpense(
      {required ExpenseEntity expense, required BuildContext context}) async {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("AlertDialog"),
          content: Text("Você tem certeza que deseja deletar esta despesa?"),
          actions: [
            ElevatedButton(
              child: Text("Cancel"),
              onPressed: () {
                Modular.to.pop();
              },
            ),
            ElevatedButton(
              child: Text("Continue"),
              onPressed: () async {
                Modular.to.pop();
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
              },
            ),
          ],
        );
      },
    );
  }
}
