import 'package:either_dart/either.dart';
import 'package:onfly/domain/entitites/expenses_entity.dart';

import '../../infra/repositories/repository.dart';

class DeleteExpenseUsecase {
  final Repository _repository;

  DeleteExpenseUsecase({
    required Repository repository,
  }) : _repository = repository;

  Future<Either<dynamic, void>> call({
    required ExpenseEntity expense,
  }) async {
    return await _repository.deleteExpense(
      expense: expense,
    );
  }
}
