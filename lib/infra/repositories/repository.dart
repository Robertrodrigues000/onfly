import 'package:either_dart/either.dart';
import 'package:dio/dio.dart';
import 'package:onfly/domain/entitites/expenses_entity.dart';

import '../../domain/repositories/repository.dart';
import '../../external/datasource/datasource.dart';

class Repository extends IRepository {
  final Datasource _datasource;
  Repository({required Datasource datasource}) : _datasource = datasource;

  @override
  Future<Either<dynamic, ExpenseEntity>> addExpense({
    required ExpenseEntity expense,
  }) async {
     try {
       ExpenseEntity response = await _datasource.addExpense(
        expense: expense,
      );
      return Right(response);
    } on DioException catch(e) {
      return Left(e);
    }
  }

  @override
  Future<Either<dynamic, ExpenseEntity>> editExpense({
    required ExpenseEntity expense,
  }) async {
     try {
       ExpenseEntity response = await _datasource.editExpense(
        expense: expense,
      );
      return Right(response);
    } on DioException catch(e) {
      return Left(e);
    }
  }

  @override
  Future<Either<dynamic, void>> deleteExpense({
    required ExpenseEntity expense,
  }) async {
     try {
       var response = await _datasource.deleteExpense(
        expense: expense,
      );
      return Right(response);
    } on DioException catch(e) {
      return Left(e);
    }
  }
  
  @override
   Future<Either<Exception, List<ExpenseEntity>>> getExpensesList() async {
     try {
       List<ExpenseEntity> response = await _datasource.getExpenseList();
      return Right(response);
    } on DioException catch(e) {
      return Left(e);
    }
  }
}
