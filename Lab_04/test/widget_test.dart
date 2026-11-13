import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:lab4/main.dart';

void main() {
  testWidgets('Shows average and updates grade', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('ממוצע: 66.3'), findsOneWidget);
    expect(find.text('ציון: 54'), findsOneWidget);
    expect(find.byIcon(Icons.cancel), findsNWidgets(2));

    // Raise יוסף from 54 to 55 -> passes.
    await tester.tap(find.byIcon(Icons.add).at(2));
    await tester.pump();

    expect(find.text('ציון: 55'), findsOneWidget);
    expect(find.byIcon(Icons.cancel), findsOneWidget);
    expect(find.text('ממוצע: 66.5'), findsOneWidget);
  });
}
