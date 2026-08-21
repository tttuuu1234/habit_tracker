import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:habit_tracker/data/providers.dart';
import 'package:habit_tracker/domain/habit/frequency_type.dart';
import 'package:habit_tracker/domain/habit/habit.dart';
import 'package:habit_tracker/domain/habit/habit_type.dart';
import 'package:habit_tracker/main.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'helpers/fake_completion_record_repository.dart';
import 'helpers/fake_habit_repository.dart';

void main() {
  setUpAll(() {
    initializeDateFormatting('ja');
  });

  final today = DateTime.now();
  final normalizedToday = DateTime(today.year, today.month, today.day);

  FakeHabitRepository createHabitRepository() {
    final repo = FakeHabitRepository();
    repo.addHabit(
      Habit(
        id: 1,
        name: '水を2L飲む',
        createdDate: DateTime(2025, 7, 1),
        colorValue: Colors.green.shade700.toARGB32(),
        frequencyType: FrequencyType.daily,
        weeklyDays: {},
        habitType: HabitType.check,
        targetTime: null,
      ),
    );
    repo.addHabit(
      Habit(
        id: 2,
        name: '30分読書',
        createdDate: DateTime(2025, 7, 15),
        colorValue: Colors.blue.shade600.toARGB32(),
        frequencyType: FrequencyType.daily,
        weeklyDays: {},
        habitType: HabitType.check,
        targetTime: null,
      ),
    );
    repo.addHabit(
      Habit(
        id: 3,
        name: '日記を書く',
        createdDate: DateTime(2025, 6, 1),
        colorValue: Colors.red.shade700.toARGB32(),
        frequencyType: FrequencyType.daily,
        weeklyDays: {},
        habitType: HabitType.check,
        targetTime: null,
      ),
    );
    repo.addHabit(
      Habit(
        id: 4,
        name: 'ストレッチ',
        createdDate: DateTime(2025, 8, 1),
        colorValue: null,
        frequencyType: FrequencyType.daily,
        weeklyDays: {},
        habitType: HabitType.check,
        targetTime: null,
      ),
    );
    repo.addHabit(
      Habit(
        id: 5,
        name: '腹筋10回',
        createdDate: DateTime(2025, 8, 10),
        colorValue: null,
        frequencyType: FrequencyType.daily,
        weeklyDays: {},
        habitType: HabitType.check,
        targetTime: null,
      ),
    );
    repo.addHabit(
      Habit(
        id: 6,
        name: '瞑想',
        createdDate: DateTime(2025, 8, 15),
        colorValue: null,
        frequencyType: FrequencyType.daily,
        weeklyDays: {},
        habitType: HabitType.time,
        targetTime: 10,
      ),
    );
    return repo;
  }

  FakeCompletionRecordRepository createCompletionRecordRepository() {
    final repo = FakeCompletionRecordRepository();
    repo.addCompletionDates(1, {normalizedToday});
    repo.addCompletionDates(2, {normalizedToday});
    repo.addCompletionDates(3, {normalizedToday});
    return repo;
  }

  Widget createApp(
    FakeHabitRepository habitRepo,
    FakeCompletionRecordRepository completionRepo,
  ) {
    return ProviderScope(
      overrides: [
        habitRepositoryProvider.overrideWithValue(habitRepo),
        completionRecordRepositoryProvider.overrideWithValue(completionRepo),
      ],
      child: const MyApp(),
    );
  }

  testWidgets('HomeScreen displays progress and habit list', (
    WidgetTester tester,
  ) async {
    final habitRepo = createHabitRepository();
    final completionRepo = createCompletionRecordRepository();
    await tester.pumpWidget(createApp(habitRepo, completionRepo));
    await tester.pumpAndSettle();

    expect(find.text('お疲れさまです'), findsOneWidget);
    expect(find.text('3/6'), findsOneWidget);
    expect(find.text('完了'), findsOneWidget);
    expect(find.text('水を2L飲む'), findsOneWidget);

    await tester.scrollUntilVisible(find.text('腹筋10回'), 100);
    expect(find.text('腹筋10回'), findsOneWidget);
  });

  testWidgets('Long press shows completion dialog', (
    WidgetTester tester,
  ) async {
    final habitRepo = createHabitRepository();
    final completionRepo = createCompletionRecordRepository();
    await tester.pumpWidget(createApp(habitRepo, completionRepo));
    await tester.pumpAndSettle();

    await tester.longPress(find.text('ストレッチ'));
    await tester.pumpAndSettle();

    expect(find.text('達成確認'), findsOneWidget);
    expect(find.text('「ストレッチ」を達成済みにしますか？'), findsOneWidget);
  });

  testWidgets('Long press on time habit navigates to timer screen', (
    WidgetTester tester,
  ) async {
    final habitRepo = createHabitRepository();
    final completionRepo = createCompletionRecordRepository();
    await tester.pumpWidget(createApp(habitRepo, completionRepo));
    await tester.pumpAndSettle();

    await tester.scrollUntilVisible(find.text('瞑想'), 100);
    await tester.ensureVisible(find.text('瞑想'));
    await tester.pumpAndSettle();
    await tester.longPress(find.text('瞑想'));
    await tester.pumpAndSettle();

    // ダイアログではなくタイマー画面に遷移する
    expect(find.text('達成確認'), findsNothing);
    expect(find.text('タイマー'), findsOneWidget);
    expect(find.text('瞑想'), findsOneWidget);
    expect(find.text('10:00'), findsOneWidget);
  });
}
