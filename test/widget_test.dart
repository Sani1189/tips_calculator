// test/widget_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:tips_calculator/main.dart';

void main() {
  testWidgets('Test TipsCalculatorPage widget', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    final totalBillField = find.byKey(Key('total_bill_input'));
    final tipPercentageField = find.byKey(Key('tip_percentage_input'));
    final numberOfPeopleField = find.byKey(Key('number_of_people_input'));

    await tester.enterText(totalBillField, '100');
    await tester.enterText(tipPercentageField, '15');
    await tester.enterText(numberOfPeopleField, '4');
    await tester.pump();

    final totalAmountWidget = find.text('Total Amount');
    expect(totalAmountWidget, findsOneWidget);
  });
}
