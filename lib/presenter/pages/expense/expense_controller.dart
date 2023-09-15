import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../domain/entitites/expenses_entity.dart';

class ExpenseController extends ChangeNotifier {
  final Function addExpense;

  final expensesListListenable = ValueNotifier<ExpenseEntity?>(null);

  TextEditingController dateCtl = TextEditingController();
  TextEditingController descriptionCtl = TextEditingController();
  TextEditingController valueCtl = TextEditingController();
  DateTime? date = DateTime(1900);

  ExpenseController({required this.addExpense});

  Future datePicker({required context}) async {
    FocusScope.of(context).requestFocus(new FocusNode());

    date = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));

    dateCtl.text = date!.toIso8601String();
  }

  void addDataExpese() {
    addExpense(
      expense: ExpenseEntity(
        description: descriptionCtl.text,
        day: DateTime.parse(dateCtl.text),
        value: double.parse(valueCtl.text),
      ),
    );
    Modular.to.pop();
  }
}
