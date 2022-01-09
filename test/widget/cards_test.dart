import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:playando/ui/components/components.dart';

void main() {
  group("Cards widgets tests:", () {
    testWidgets("Video Card", (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: VideoCard(
              title:
                  "Cooking with Marshmello: How To Make Greek Salad Hello loves, This week on Cooking with Marshmello we make the best",
              thumbnail: "https://i.ytimg.com/vi/dh6ob389CYU/hqdefault.jpg",
            ),
          ),
        ),
      );

      await tester.pump();
      expect(
          find.text(
              "Cooking with Marshmello: How To Make Greek Salad Hello loves, This week on Cooking with Marshmello we make the best"),
          findsOneWidget);
      expect(find.byIcon(Icons.play_arrow_rounded), findsOneWidget);

      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: VideoCard(
              title:
                  "Cooking with Marshmello: How To Make Greek Salad Hello loves, This week on Cooking with Marshmello we make the best",
              thumbnail: "https://i.ytimg.com/vi/dh6ob389CYU/hqdefault.jpg",
              playing: true,
            ),
          ),
        ),
      );

      await tester.pump();
      expect(find.byIcon(Icons.pause_rounded), findsOneWidget);
    });
  });
}
