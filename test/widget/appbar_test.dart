import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:playando/ui/components/components.dart';

void main() {
  group("AppBar widgets tests:", () {
    testWidgets("Custom Sliver AppBar", (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: CustomScrollView(
              slivers: [
                CustomSliverAppBar(),
              ],
            ),
          ),
        ),
      );

      await tester.pump();
      expect(find.text("Playando"), findsOneWidget);
    });
  });
}
