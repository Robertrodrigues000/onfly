import 'package:onfly/domain/entitites/expenses_entity.dart';

abstract class IDatasource {
  Future<ExpenseEntity> addExpense({
    required ExpenseEntity expense,
  });

  Future<ExpenseEntity> editExpense({
    required ExpenseEntity expense,
  });

  Future<void> deleteExpense({
    required ExpenseEntity expense,
  });

  Future<List<ExpenseEntity>> getExpenseList();
}
