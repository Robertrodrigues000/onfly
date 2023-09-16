import 'package:onfly/domain/entitites/expenses_entity.dart';

abstract class IRepository {
  // Future<Either<dynamic, HomeInfoEntity>>getHomeInfo();
  Future<ExpenseEntity> addExpense({
    required ExpenseEntity expense,
  });
}
