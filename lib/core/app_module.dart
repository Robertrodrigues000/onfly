import 'package:flutter_modular/flutter_modular.dart';
import 'package:onfly/domain/usecases/add_expense_usecase.dart';
import 'package:onfly/presenter/pages/expense/expense_page.dart';

import '../domain/usecases/delete_expense_usecase.dart';
import '../domain/usecases/get_expense_list_usecase.dart';
import '../external/datasource/datasource.dart';
import '../domain/repositories/repository.dart';
import '../infra/datasource/datasource.dart';
import '../infra/repositories/repository.dart';
import '../presenter/pages/home/home_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.lazySingleton<IDatasource>(
          (i) => Datasource(),
        ),
        Bind.lazySingleton<IRepository>(
          (i) => Repository(datasource: i.get()),
        ),
        Bind.lazySingleton(
          (i) => AddExpenseUsecase(repository: i.get()),
        ),
        Bind.lazySingleton(
          (i) => DeleteExpenseUsecase(repository: i.get()),
        ),
        Bind.lazySingleton(
          (i) => GetExpenseListUsecase(repository: i.get()),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          '/',
          child: (context, args) => const HomePage(),
        ),
        ChildRoute(
          '/expense/',
          child: (context, args) => ExpensePage(
             addExpense: args.data['addExperiense'],
             expense: args.data['expense'],
          ),
        ),
      ];
}
