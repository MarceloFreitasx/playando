import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:playando/ui/components/components.dart';

void main() {
  group("Forms widgets tests:", () {
    testWidgets("TextField", (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomTextField(
              hint: "Test custom field hint",
            ),
          ),
        ),
      );

      await tester.pump();
      expect(find.text("Test custom field hint"), findsOneWidget);
    });
  });
}
