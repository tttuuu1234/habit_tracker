import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/habit/frequency_type.dart';

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

    /// 選択中のカラー。
    @Default(null) Color? color,

    /// 編集対象の習慣インデックス（nullなら作成モード）。
    @Default(null) int? editingHabitIndex,

    /// 保存処理中かどうか。
    @Default(false) bool isSaving,
  }) = _HabitFormState;

  /// 作成モードかどうか。
  bool get isCreateMode => editingHabitIndex == null;

  /// フォーム入力が有効かどうか。
  bool get isValid {
    final trimmedName = name.trim();
    if (trimmedName.isEmpty || trimmedName.length > 30) return false;
    if (frequencyType == FrequencyType.weekly && weeklyDays.isEmpty) {
      return false;
    }
    return true;
  }
}
