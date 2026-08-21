import 'package:freezed_annotation/freezed_annotation.dart';

part 'habit_summary.freezed.dart';

/// ホーム画面に表示する習慣サマリー。
@freezed
sealed class HabitSummary with _$HabitSummary {
  /// チェック方式の習慣サマリー。
  const factory HabitSummary.check({
    /// 習慣ID。
    required int id,

    /// 習慣名。
    required String name,

    /// 現在の連続達成日数。
    required int streakDays,

    /// 今日達成済みかどうか。
    required bool isCompleted,

    /// テーマカラーの値。
    required int? colorValue,
  }) = CheckHabitSummary;

  /// 時間方式の習慣サマリー。
  const factory HabitSummary.time({
    /// 習慣ID。
    required int id,

    /// 習慣名。
    required String name,

    /// 現在の連続達成日数。
    required int streakDays,

    /// 今日達成済みかどうか。
    required bool isCompleted,

    /// テーマカラーの値。
    required int? colorValue,

    /// 目標時間（分）。
    required int targetTime,
  }) = TimeHabitSummary;
}
