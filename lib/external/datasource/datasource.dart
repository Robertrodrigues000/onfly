import 'dart:convert';

import 'package:http/http.dart';
import 'package:onfly/domain/entitites/expenses_entity.dart';
import 'package:onfly/external/mappers/expense_mapper.dart';

import '../../infra/datasource/datasource.dart';

class Datasource extends IDatasource {
  String get _token =>
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJjb2xsZWN0aW9uSWQiOiJfcGJfdXNlcnNfYXV0aF8iLCJleHAiOjE2OTYwNzY2NzksImlkIjoibDFqNnV5b2V4NGNla21wIiwidHlwZSI6ImF1dGhSZWNvcmQifQ.ihHizKyJkkUTJclNPSIC4NPIW-t4LeA3aJjZRQC4Cjk";

  Map<String, String> get headers => {
        // "Content-Type": "application/json",
        // "Accept": "application/json",
        "Authorization": "Bearer $_token",
      };

  String get urlPrefix => 'https://go-bd-api-3iyuzyysfa-uc.a.run.app/api';

  @override
  Future<ExpenseEntity> addExpense({
    required ExpenseEntity expense,
  }) async {
    final uri = Uri.parse('$urlPrefix/collections/expense_GNSsHd/records');
    Map data = {
      "description": expense.description,
      "expense_date": expense.day.toString(),
      "amount": 12.11,
    };
    var body = json.encode(data);

    Response response = await post(
      uri,
      headers: {
        "Authorization": _token,
        "Content-Type": "application/json",
      },
      body: body,
    );
    return ExpenseMapper.fromMap(jsonDecode(response.body));
  }

  @override
  Future<void> deleteExpense({
    required ExpenseEntity expense,
  }) async {
    final uri = Uri.parse(
        '$urlPrefix/collections/expense_GNSsHd/records/${expense.id}');
    Response response = await delete(
      uri,
      headers: {
        "Authorization": _token,
        "Content-Type": "application/json",
      },
    );
    if (response.statusCode == 200) {
      print('object');
    }
  }

  @override
  Future<List<ExpenseEntity>> getExpenseList() async {
    final uri = Uri.parse('$urlPrefix/collections/expense_GNSsHd/records');

    Response response = await get(
      uri,
      headers: {
        "Authorization": _token,
        "Content-Type": "application/json",
      },
    );

    var data = jsonDecode(response.body);

    List<ExpenseEntity> data2 = (data['items'] as List)
        .map((item) => ExpenseMapper.fromMap(item))
        .toList();
    return data2;
  }
}
