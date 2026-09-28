import 'package:flutter_test/flutter_test.dart';
import 'package:app12/main.dart';

void main() {
  testWidgets('MathSprint renders app correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const MathSprintApp());
    expect(find.byType(MathSprintApp), findsOneWidget);
  });
}
