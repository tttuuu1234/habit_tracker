import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../mock_data.dart';
import 'habit_detail_state.dart';

part 'habit_detail_notifier.g.dart';

/// 習慣詳細画面の状態を管理するNotifier。
@riverpod
class HabitDetail extends _$HabitDetail {
  /// モックデータから習慣情報と達成記録を取得し、初期状態を生成する。
  @override
  HabitDetailState build(int habitIndex) {
    final habit = mockHabits[habitIndex];
    final completionDates = mockCompletionRecords[habitIndex] ?? {};
    final now = DateTime.now();

    return HabitDetailState(
      habitName: habit.name,
      habitCreatedDate: habit.createdDate,
      habitColor: habit.color,
      completionDates: completionDates,
      displayMonth: DateTime(now.year, now.month),
    );
  }

  /// カレンダーの表示月を前月に切り替える。
  void goToPreviousMonth() {
    final current = state.displayMonth;
    state = state.copyWith(
      displayMonth: DateTime(current.year, current.month - 1),
    );
  }

  /// カレンダーの表示月を翌月に切り替える。
  void goToNextMonth() {
    final current = state.displayMonth;
    state = state.copyWith(
      displayMonth: DateTime(current.year, current.month + 1),
    );
  }
}
