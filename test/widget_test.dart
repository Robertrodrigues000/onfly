import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:onfly/presenter/pages/home/home_page.dart';

void main() {
  testWidgets('Find bottomBar test', (WidgetTester tester) async {
    WidgetsFlutterBinding.ensureInitialized();

    await tester.pumpWidget(BottomInfo(totalExpense: 20));

    final Finder titleFinder = find.byKey(Key('bottomInfo'),);

    expect(titleFinder, findsOneWidget);
  });
}
