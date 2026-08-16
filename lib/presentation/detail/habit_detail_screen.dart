import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'notifiers/habit_detail_notifier.dart';
import 'widgets/monthly_calendar.dart';
import 'widgets/stats_card.dart';
import 'widgets/streak_header.dart';

class HabitDetailScreen extends ConsumerWidget {
  const HabitDetailScreen({
    super.key,
    required this.habitIndex,
  });

  final int habitIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(habitDetailProvider(habitIndex));
    final notifier = ref.read(habitDetailProvider(habitIndex).notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(state.habitName),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            StreakHeader(streakDays: state.currentStreak),
            const SizedBox(height: 32),
            MonthlyCalendar(
              displayMonth: state.displayMonth,
              completedDates: state.completionDates,
              habitCreatedDate: state.habitCreatedDate,
              canGoBack: state.canGoBack,
              canGoForward: state.canGoForward,
              onPreviousMonth: notifier.goToPreviousMonth,
              onNextMonth: notifier.goToNextMonth,
            ),
            const SizedBox(height: 32),
            StatsCard(
              longestStreak: state.longestStreak,
              completionRate: state.completionRate,
            ),
          ],
        ),
      ),
    );
  }
}
