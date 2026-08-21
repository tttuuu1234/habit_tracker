import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/habit/habit_type.dart';

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

    /// 習慣の種別。
    required HabitType habitType,

    /// 目標時間（分）。時間方式の場合のみ使用。
    required int? targetTime,
  }) = _HabitSummary;
}
