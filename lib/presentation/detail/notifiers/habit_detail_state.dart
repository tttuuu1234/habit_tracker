import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'habit_detail_state.freezed.dart';

/// 習慣詳細画面の状態。
@freezed
abstract class HabitDetailState with _$HabitDetailState {
  const HabitDetailState._();

  const factory HabitDetailState({
    /// 習慣名。
    required String habitName,

    /// 習慣の登録日。
    required DateTime habitCreatedDate,

    /// 習慣のテーマカラー。
    required Color? habitColor,

    /// 達成した日付の集合。
    required Set<DateTime> completionDates,

    /// カレンダーに表示中の年月。
    required DateTime displayMonth,
  }) = _HabitDetailState;

  /// 今日から遡って途切れずに達成している日数。
  /// 今日が未達成でも昨日まで連続していればその日数を返す。
  int get currentStreak {
    final today = DateTime.now();
    final normalizedToday = DateTime(today.year, today.month, today.day);
    final normalizedCreated = DateTime(
      habitCreatedDate.year,
      habitCreatedDate.month,
      habitCreatedDate.day,
    );
    var streak = 0;

    for (var i = 0;; i++) {
      final date = normalizedToday.subtract(Duration(days: i));

      if (date.isBefore(normalizedCreated)) break;

      if (completionDates.contains(date)) {
        streak++;
        continue;
      }
      // 今日が未達成の場合はスキップし、それ以降で途切れたら終了
      if (i > 0) break;
    }

    return streak;
  }

  /// 全期間で最も長く連続して達成した日数。
  int get longestStreak {
    if (completionDates.isEmpty) return 0;

    final sortedDates = completionDates.toList()..sort();
    var longest = 1;
    var current = 1;

    for (var i = 1; i < sortedDates.length; i++) {
      final diff = sortedDates[i].difference(sortedDates[i - 1]).inDays;
      if (diff != 1) {
        current = 1;
        continue;
      }
      current++;
      if (current > longest) longest = current;
    }

    return longest;
  }

  /// 登録日から今日までの達成率（%、小数点以下切り捨て）。
  int get completionRate {
    final normalizedCreated = DateTime(
      habitCreatedDate.year,
      habitCreatedDate.month,
      habitCreatedDate.day,
    );
    final today = DateTime.now();
    final normalizedToday = DateTime(today.year, today.month, today.day);
    final totalDays = normalizedToday.difference(normalizedCreated).inDays + 1;

    if (totalDays <= 0) return 0;

    return (completionDates.length * 100 ~/ totalDays);
  }

  /// カレンダーを前月に戻せるかどうか。
  bool get canGoBack {
    final createdMonth = DateTime(
      habitCreatedDate.year,
      habitCreatedDate.month,
    );
    return displayMonth.isAfter(createdMonth);
  }

  /// カレンダーを翌月に進められるかどうか。
  bool get canGoForward {
    final now = DateTime.now();
    final currentMonth = DateTime(now.year, now.month);
    return displayMonth.isBefore(currentMonth);
  }
}
