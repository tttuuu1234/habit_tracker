import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'package:habit_tracker/main.dart';

void main() {
  setUpAll(() {
    initializeDateFormatting('ja');
  });

  testWidgets('HomeScreen displays progress and habit list', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('お疲れさまです'), findsOneWidget);
    expect(find.text('3/5'), findsOneWidget);
    expect(find.text('完了'), findsOneWidget);
    expect(find.text('水を2L飲む'), findsOneWidget);
    expect(find.text('腹筋10回'), findsOneWidget);
  });

  testWidgets('Long press shows completion dialog', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    await tester.longPress(find.text('ストレッチ'));
    await tester.pumpAndSettle();

    expect(find.text('達成確認'), findsOneWidget);
    expect(find.text('「ストレッチ」を達成済みにしますか？'), findsOneWidget);
  });
}
