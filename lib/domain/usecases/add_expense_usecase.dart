import 'package:either_dart/either.dart';
import 'package:onfly/domain/entitites/expenses_entity.dart';

import '../../infra/repositories/repository.dart';

class AddExpenseUsecase {
  final Repository _repository;

  AddExpenseUsecase({
    required Repository repository,
  }) : _repository = repository;

  Future<Either<dynamic, ExpenseEntity>> call({
    required ExpenseEntity expense,
  }) async {
    return await _repository.addExpense(
      expense: expense,
    );
  }
}
