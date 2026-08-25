import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/providers.dart';
import '../../../domain/habit/habit_type.dart';
import '../../../domain/result.dart';
import 'habit_summary.dart';
import 'home_state.dart';

part 'home_notifier.g.dart';

/// ホーム画面の状態を管理するNotifier。
@riverpod
class Home extends _$Home {
  @override
  Future<HomeState> build() async {
    return _loadHabits();
  }

  /// 習慣データをリポジトリから読み込む。
  Future<HomeState> _loadHabits() async {
    final habitRepo = ref.read(habitRepositoryProvider);
    final completionRepo = ref.read(completionRecordRepositoryProvider);
    final result = await habitRepo.getActive();

    return switch (result) {
      Success(:final value) => HomeState(
          habits: await Future.wait(
            value.map((habit) async {
              final completionResult =
                  await completionRepo.getCompletionDates(habit.id);
              final completionDates = switch (completionResult) {
                Success(:final value) => value,
                Failure() => <DateTime>{},
              };
              final streakDays = _calculateStreak(completionDates);
              final today = DateTime.now();
              final normalizedToday =
                  DateTime(today.year, today.month, today.day);
              final isCompleted =
                  completionDates.contains(normalizedToday);

              return switch (habit.habitType) {
                HabitType.check => HabitSummary.check(
                    id: habit.id,
                    name: habit.name,
                    streakDays: streakDays,
                    isCompleted: isCompleted,
                    colorValue: habit.colorValue,
                  ),
                HabitType.time => HabitSummary.time(
                    id: habit.id,
                    name: habit.name,
                    streakDays: streakDays,
                    isCompleted: isCompleted,
                    colorValue: habit.colorValue,
                    targetTime: habit.targetTime!,
                  ),
              };
            }),
          ),
        ),
      Failure(:final message) => HomeState(errorMessage: message),
    };
  }

  /// 今日の達成状態をトグルする。
  Future<void> toggleCompletion(int habitId) async {
    final completionRepo = ref.read(completionRecordRepositoryProvider);
    final today = DateTime.now();
    final normalizedToday = DateTime(today.year, today.month, today.day);

    final isCompleted =
        await completionRepo.isCompletedOn(habitId, normalizedToday);

    if (isCompleted) {
      await completionRepo.removeCompletion(habitId, normalizedToday);
    } else {
      await completionRepo.addCompletion(habitId, normalizedToday);
    }

    final currentState = state.value;
    final loaded = await _loadHabits();
    state = AsyncData(
      loaded.copyWith(
        isCompletedSectionCollapsed:
            currentState?.isCompletedSectionCollapsed ?? false,
      ),
    );
  }

  /// 達成済みセクションの折りたたみ状態をトグルする。
  void toggleCompletedSection() {
    final currentState = state.value;
    if (currentState == null) return;
    state = AsyncData(
      currentState.copyWith(
        isCompletedSectionCollapsed: !currentState.isCompletedSectionCollapsed,
      ),
    );
  }

  /// データを再読み込みする。
  Future<void> refresh() async {
    state = const AsyncLoading();
    state = AsyncData(await _loadHabits());
  }

  /// 達成日のセットから現在のストリーク日数を計算する。
  int _calculateStreak(Set<DateTime> completionDates) {
    final today = DateTime.now();
    final normalizedToday = DateTime(today.year, today.month, today.day);
    var streak = 0;

    for (var i = 0;; i++) {
      final date = normalizedToday.subtract(Duration(days: i));
      if (completionDates.contains(date)) {
        streak++;
        continue;
      }
      // 今日が未達成の場合はスキップし、それ以降で途切れたら終了
      if (i > 0) break;
    }

    return streak;
  }
}
