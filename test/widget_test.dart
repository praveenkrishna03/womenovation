import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:womenovation/main.dart';

void main() {
  group('VerifyPage', () {
    testWidgets('should display heading and input box',
        (WidgetTester tester) async {
      // Build the widget tree.
      await tester.pumpWidget(MyApp());

      // Find the VerifyPage widget.
      final verifyPage = find.byType(VerifyPage);

      // Verify that the widget displays the heading and input box.
      expect(find.text('Verify'), findsOneWidget);
      expect(find.text('Enter your phone number:'), findsOneWidget);
      expect(find.byType(TextField), findsOneWidget);
    });

    testWidgets('should validate phone number input',
        (WidgetTester tester) async {
      // Build the widget tree.
      await tester.pumpWidget(MyApp());

      // Find the input box widget.
      final inputBox = find.byType(TextField);

      // Enter an invalid phone number.
      await tester.enterText(inputBox, '123');

      // Tap the Verify button.
      await tester.tap(find.text('Verify'));

      // Rebuild the widget tree with the updated state.
      await tester.pump();

      // Verify that an error message is displayed.
      expect(find.text('Please enter a valid phone number.'), findsOneWidget);

      // Enter a valid phone number.
      await tester.enterText(inputBox, '555-555-5555');

      // Tap the Verify button.
      await tester.tap(find.text('Verify'));

      // Rebuild the widget tree with the updated state.
      await tester.pump();

      // Verify that the phone number is validated.
      expect(find.text('Phone number is valid.'), findsOneWidget);
    });
  });
}
