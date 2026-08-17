import 'package:freezed_annotation/freezed_annotation.dart';

part 'habit_summary.freezed.dart';

/// ホーム画面に表示する習慣サマリー。
@freezed
abstract class HabitSummary with _$HabitSummary {
  const factory HabitSummary({
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
  }) = _HabitSummary;
}
