import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'notifiers/habit_detail_notifier.dart';
import 'widgets/monthly_calendar.dart';
import 'widgets/stats_card.dart';
import 'widgets/streak_header.dart';

class HabitDetailScreen extends ConsumerWidget {
  const HabitDetailScreen({
    super.key,
    required this.habitId,
  });

  final int habitId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncState = ref.watch(habitDetailProvider(habitId));

    return asyncState.when(
      loading: () => Scaffold(
        appBar: AppBar(),
        body: const Center(child: CircularProgressIndicator()),
      ),
      error: (error, _) => Scaffold(
        appBar: AppBar(),
        body: Center(child: Text('エラー: $error')),
      ),
      data: (state) {
        final notifier = ref.read(habitDetailProvider(habitId).notifier);

        return Scaffold(
          appBar: AppBar(
            title: Text(state.habitName),
            actions: [
              IconButton(
                icon: const Icon(Icons.edit_outlined),
                onPressed: () async {
                  await context.push('/edit/$habitId');
                  ref.invalidate(habitDetailProvider(habitId));
                },
              ),
            ],
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
      },
    );
  }
}
