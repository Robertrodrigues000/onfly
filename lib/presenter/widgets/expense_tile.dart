import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../domain/entitites/expenses_entity.dart';
import 'app_button.dart';

class ExpenseTile extends StatelessWidget {
  final ExpenseEntity expense;
  final Function onDelete;

  const ExpenseTile({
    super.key,
    required this.expense, required this.onDelete,
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
                Text(expense.description),
                Text(DateFormat("dd/MM/yyyy").format(expense.day)),
              ],
            ),
            Column(
              children: [
                Text('R\$ ${expense.value}'),
                Icon(
                  Icons.wifi_off,
                  size: 20,
                  color: Colors.red,
                )
              ],
            ),
          ],
        ),
        children: [
          Text("Name : User ${expense.description}"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppButton(
                title: "Editar",
                width: 120,
                onPressed: () {},
              ),
              AppButton(
                title: "Deletar",
                width: 120,
                onPressed: () => onDelete(expense: expense),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
