import 'package:onfly/domain/entitites/expenses_entity.dart';

import '../../infra/repositories/repository.dart';

class AddExpenseUsecase {
  final Repository _repository;

  AddExpenseUsecase({
    required Repository repository,
  }) : _repository = repository;

  Future<ExpenseEntity> call({
    required ExpenseEntity expense,
  }) async {
    return await _repository.addExpense(
      expense: expense,
    );
  }
}
