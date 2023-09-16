import 'package:onfly/domain/entitites/expenses_entity.dart';

abstract class IDatasource {
  Future<ExpenseEntity> addExpense({
    required ExpenseEntity expense,
  });
}
