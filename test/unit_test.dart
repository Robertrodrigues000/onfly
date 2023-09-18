import 'package:flutter_test/flutter_test.dart';
import 'package:onfly/domain/entitites/expenses_entity.dart';
import 'package:onfly/external/mappers/expense_mapper.dart';

void main() {
  test('Create a model from Json', () {
    final fake = ExpenseMapper.fake();

    final json = {
      'id': fake.id,
      'day': fake.day,
      'amount': fake.amount,
      'description': fake.description,
    };

    final automationData = ExpenseMapper.fromMap(json);

    expect(automationData, isA<ExpenseEntity>());
    expect(automationData, fake);
  });

  test('Create a fake model', () {
    final automationData = ExpenseMapper.fake();

    expect(automationData, isA<ExpenseEntity>());

    final other = ExpenseMapper.fake();

    expect(other, isNot(automationData));
  });
}
