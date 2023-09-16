import 'package:http/http.dart';
import 'package:onfly/domain/entitites/expenses_entity.dart';

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
    // var url = "$urlPrefix/collections/expense_GNSsHd/records";
    // Client client = Client();
    // String jsonBody = json.encode({
    //   "description": expense.description,
    //   "expense_date": expense.day.toIso8601String(),
    //   "amount": expense.amount.toString(),
    // });
    // var response = await client.post(
    //   Uri.parse(url),
    //   body: jsonBody,
    //   headers: headers,
    // );
    // if (response.statusCode != 200) {
    //   throw Exception(
    //       "Request to $url failed with status ${response.statusCode}: ${response.body}");
    // }

    final uri = Uri.parse('$urlPrefix/collections/expense_GNSsHd/records');
    final headers = {
      "Authorization": "Bearer $_token",
    };
    Map<String, dynamic> body = {
      "description": "description",
      "expense_date": "2023-09-01 10:00:00.123Z",
      "amount": "12.11"
    };

    Response response = await post(
      uri,
      headers: headers,
      body: body,
    );

    String responseBody = response.body;
    print(responseBody);

    try {
      // final response =
      //     await hasuraConnect.query(AppQueries.getBook(bookId: bookId));
      // return BookMapper.fromMap(response['data']['book']);
      return ExpenseEntity(
          day: DateTime.now(), description: 'asdf', amount: 12);
    } catch (e) {
      rethrow;
    }
  }
}
