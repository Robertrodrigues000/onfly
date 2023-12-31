import 'package:faker/faker.dart';

import '../../domain/entitites/expenses_entity.dart';

class ExpenseMapper {
  static ExpenseEntity fromMap(Map<String, dynamic> map) {
    return ExpenseEntity(
      id: map['id'],
      description: map['description'],
      amount: map['amount'].toDouble(),
      day: DateTime.parse(map['expense_date']),
      latitude: map['latitude'],
      longitude: map['longitude'],
    );
  }

  static ExpenseEntity fake() {
    return ExpenseEntity(
      id: faker.randomGenerator.string(7),
      amount: faker.randomGenerator.decimal(),
      description: faker.lorem.sentence(),
      day: faker.date.dateTime(),
      latitude: faker.randomGenerator.numberOfLength(8).toString(),
      longitude: faker.randomGenerator.numberOfLength(8).toString(),
    );
  }
}
