import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:playando/ui/components/components.dart';

void main() {
  group("Buttons widgets tests:", () {
    testWidgets("AddButton", (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: AddButton(),
          ),
        ),
      );

      await tester.pump();
      expect(find.text("Adicionar"), findsOneWidget);
    });

    testWidgets("FilterButton", (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FilterButton(),
          ),
        ),
      );

      await tester.pump();
      expect(find.text("Filtrar"), findsOneWidget);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: FilterButton(
              clear: true,
            ),
          ),
        ),
      );

      await tester.pump();
      expect(find.text("Limpar Filtro"), findsOneWidget);
    });

    testWidgets("PlayPauseButton", (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PlayPauseButton(),
          ),
        ),
      );

      await tester.pump();
      expect(find.byIcon(Icons.play_arrow_rounded), findsOneWidget);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: PlayPauseButton(
              playing: true,
            ),
          ),
        ),
      );

      await tester.pump();
      expect(find.byIcon(Icons.pause_rounded), findsOneWidget);
    });

    testWidgets("RemoveButton", (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: RemoveButton(),
          ),
        ),
      );

      await tester.pump();
      expect(find.byIcon(Icons.cancel_outlined), findsOneWidget);
    });
  });
}
