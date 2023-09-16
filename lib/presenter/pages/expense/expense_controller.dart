import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

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

    dateCtl.text = DateFormat("dd/MM/yyyy").format(date!);
  }

  void addDataExpese() {
    addExpense(
      expense: ExpenseEntity(
        description: descriptionCtl.text,
        day: (new DateFormat('dd/MM/yyyy').parse(dateCtl.text)),
        value: _getNumber(valueCtl.text),
      ),
    );
    Modular.to.pop();
  }

  double _getNumber(String number) {
    String newNumber = number.replaceAll(RegExp(r','), '.');
   newNumber = newNumber.replaceAll("R\$","");
    return double.parse(newNumber);
  }
}
