import 'package:onfly/domain/entitites/expenses_entity.dart';

import '../../domain/repositories/repository.dart';
import '../../external/datasource/datasource.dart';

class Repository extends IRepository {
  final Datasource _datasource;
  Repository({required Datasource datasource}) : _datasource = datasource;

  // @override
  // Future<Either<Exception, HomeInfoEntity>> getHomeInfo() async {
  //   try {
  //     HomeInfoEntity response = await _datasource.getHomeInfo();
  //     return Right(response);
  //   } on DioException catch(e) {
  //     return Left(e);
  //   }
  // }

  @override
  Future<ExpenseEntity> addExpense({
    required ExpenseEntity expense,
  }) {
    try {
      return _datasource.addExpense(
        expense: expense,
      );
    } catch (e) {
      // SnackbarHelper.error(
      //   message:
      //       'Erro ao carregar as informações do livro, favor tentar novamente mais tarde.',
      //   context: context!,
      // );
      rethrow;
    }
  }
}
