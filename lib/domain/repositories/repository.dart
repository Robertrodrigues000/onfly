import 'package:either_dart/either.dart';
import 'package:onfly/domain/entitites/expenses_entity.dart';

abstract class IRepository {
  Future<Either<dynamic, ExpenseEntity>> addExpense({
    required ExpenseEntity expense,
  });

  Future<Either<dynamic, ExpenseEntity>> editExpense({
    required ExpenseEntity expense,
  });

  Future<Either<dynamic, void>> deleteExpense({
    required ExpenseEntity expense,
  });

  Future<Either<Exception, List<ExpenseEntity>>> getExpensesList();
}
