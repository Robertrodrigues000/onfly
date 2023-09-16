import 'package:faker/faker.dart';

import '../../domain/entitites/expenses_entity.dart';

class ExpenseMapper {
  static ExpenseEntity fromMap(Map<String, dynamic> map) {
    return ExpenseEntity(
      id: map['id'],
      description: map['description'],
      amount: map['amount'],
      day: DateTime.parse(map['expense_date']),
    );
  }

  static ExpenseEntity fake() {
    return ExpenseEntity(
      id: faker.randomGenerator.string(7),
      amount: faker.randomGenerator.decimal(),
      description: faker.lorem.sentence(),
      day: faker.date.dateTime(),
    );
  }
}
