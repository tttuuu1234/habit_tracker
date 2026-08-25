import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/habit/frequency_type.dart';
import '../../../domain/habit/habit_category.dart';
import '../../../domain/habit/habit_type.dart';

part 'habit_form_state.freezed.dart';

/// 習慣作成・編集フォームの状態。
@freezed
abstract class HabitFormState with _$HabitFormState {
  const HabitFormState._();

  const factory HabitFormState({
    /// 習慣名。
    @Default('') String name,

    /// 頻度種別。
    @Default(FrequencyType.daily) FrequencyType frequencyType,

    /// 曜日指定時の対象曜日（1=月〜7=日）。
    @Default({}) Set<int> weeklyDays,

    /// 選択中のカテゴリ。
    @Default(null) HabitCategory? category,

    /// 編集対象の習慣ID（nullなら作成モード）。
    @Default(null) int? editingHabitId,

    /// 保存処理中かどうか。
    @Default(false) bool isSaving,

    /// 習慣の種別。
    @Default(HabitType.check) HabitType habitType,

    /// 目標時間（分）。時間方式の場合のみ使用。
    @Default(null) int? targetTime,
  }) = _HabitFormState;

  /// 作成モードかどうか。
  bool get isCreateMode => editingHabitId == null;

  /// フォーム入力が有効かどうか。
  bool get isValid {
    final trimmedName = name.trim();
    if (trimmedName.isEmpty || trimmedName.length > 30) return false;
    if (frequencyType == FrequencyType.weekly && weeklyDays.isEmpty) {
      return false;
    }
    if (habitType == HabitType.time) {
      if (targetTime == null || targetTime! <= 0) return false;
    }
    return true;
  }
}
