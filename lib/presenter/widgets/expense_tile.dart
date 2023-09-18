import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:intl/intl.dart';

import '../../core/theme/app_text.dart';
import '../../domain/entitites/expenses_entity.dart';
import 'app_button.dart';

class ExpenseTile extends StatelessWidget {
  final ExpenseEntity expense;
  final Function formatAmount;
  final Function onDelete;
  final Function addExpense;

  const ExpenseTile({
    super.key,
    required this.expense,
    required this.onDelete,
    required this.addExpense,
    required this.formatAmount,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ExpansionTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText.bodyText(expense.description),
                AppText.bodyText(DateFormat("dd/MM/yyyy").format(expense.day)),
              ],
            ),
            Column(
              children: [
                AppText.bodyText(formatAmount(expense.amount)),
                expense.syncronized ?? true
                    ? Container()
                    : Icon(
                        Icons.wifi_off,
                        size: 20,
                        color: Colors.red,
                      )
              ],
            ),
          ],
        ),
        children: [
          if (expense.file != null)
            Image.file(
              File(expense.file!.path),
              height: 100,
              fit: BoxFit.fill,
            ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppButton(
                title: "Editar",
                width: 120,
                onPressed: () => Modular.to.pushNamed(
                  '/expense/',
                  arguments: {
                    'addExperiense': addExpense,
                    'expense': expense,
                  },
                ),
              ),
              AppButton(
                title: "Deletar",
                width: 120,
                onPressed: () => onDelete(expense: expense, context: context),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
