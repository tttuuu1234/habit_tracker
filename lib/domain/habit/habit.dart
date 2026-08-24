import 'package:freezed_annotation/freezed_annotation.dart';

import 'frequency_type.dart';
import 'habit_type.dart';

part 'habit.freezed.dart';

/// 習慣エンティティ。
@freezed
abstract class Habit with _$Habit {
  const factory Habit({
    /// 一意なID。
    required int id,

    /// 習慣名。
    required String name,

    /// 登録日。
    required DateTime createdDate,

    /// テーマカラーの値（null時はデフォルト色を使用）。
    required int? colorValue,

    /// 頻度種別。
    required FrequencyType frequencyType,

    /// 曜日指定時の対象曜日（1=月〜7=日）。
    required Set<int> weeklyDays,

    /// 習慣の種別。
    required HabitType habitType,

    /// 目標時間（分）。時間方式の場合のみ使用。
    required int? targetTime,

    /// アーカイブ済みかどうか。
    @Default(false) bool isArchived,
  }) = _Habit;
}
