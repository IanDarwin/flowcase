import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Main Demo UI smoke test', (WidgetTester tester) async {

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.text("Button"));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('Push me'), findsOneWidget);
  });
}
