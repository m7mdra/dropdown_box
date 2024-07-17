import 'package:dropdown_box/dropdown_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets(
    'test empty options',
    (tester) async {
      const valueKey = GlobalObjectKey('key_key');
      const firstItemKey = ValueKey('1');
      String? value;
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(
          body: DropdownBox(
              onChanged: (newValue) {
                value = newValue;
              },
              key: valueKey,
              options: [
                DropdownBoxItem(
                    label: 'Option 1', value: '1', key: firstItemKey),
                DropdownBoxItem(
                    label: 'Option 2', value: '2', key: const ValueKey('2')),
                DropdownBoxItem(
                    label: 'Option 3', value: '3', key: const ValueKey('3')),
              ],
              placeholder: 'Select value'),
        ),
      ));
      await tester.pump();
      final widgetFinder = find.byKey(valueKey);
      expect(widgetFinder, findsOneWidget);
      await tester.tap(widgetFinder);
      await tester.pumpAndSettle();
      final firstOption = find.byKey(firstItemKey);
      expect(firstOption, findsOneWidget);
      await tester.tap(firstOption);
      await tester.pumpAndSettle();
      expect(value, equals('1'));
    },
  );
}
