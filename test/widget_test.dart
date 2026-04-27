import 'package:flutter_test/flutter_test.dart';

import 'package:josh_wpblog/main.dart';

void main() {
  testWidgets('App builds smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Expect to find MyApp
    expect(find.byType(MyApp), findsOneWidget);
  });
}
