import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../domain/habit/frequency_type.dart';
import '../../mock_data.dart';
import 'habit_form_state.dart';

part 'habit_form_notifier.g.dart';

/// 習慣作成・編集フォームの状態を管理するNotifier。
@riverpod
class HabitForm extends _$HabitForm {
  /// 初期状態を生成する。editingHabitIndexがnullなら作成モード。
  @override
  HabitFormState build(int? editingHabitIndex) {
    if (editingHabitIndex == null) {
      return const HabitFormState();
    }

    final habit = mockHabits[editingHabitIndex];
    return HabitFormState(
      name: habit.name,
      frequencyType: habit.frequencyType,
      weeklyDays: habit.weeklyDays,
      color: habit.color,
      editingHabitIndex: editingHabitIndex,
    );
  }

  /// 習慣名を更新する。
  void updateName(String name) {
    state = state.copyWith(name: name);
  }

  /// 頻度種別を更新する。
  void updateFrequencyType(FrequencyType frequencyType) {
    state = state.copyWith(frequencyType: frequencyType);
  }

  /// 曜日の選択状態をトグルする。
  void toggleWeekday(int day) {
    final days = Set<int>.from(state.weeklyDays);
    if (days.contains(day)) {
      days.remove(day);
    } else {
      days.add(day);
    }
    state = state.copyWith(weeklyDays: days);
  }

  /// カラーを更新する。
  void updateColor(Color? color) {
    state = state.copyWith(color: color);
  }

  /// 習慣を保存する。作成モードならリストに追加、編集モードなら更新。
  void save() {
    if (!state.isValid || state.isSaving) return;
    state = state.copyWith(isSaving: true);

    final trimmedName = state.name.trim();
    if (state.isCreateMode) {
      mockHabits.add(
        MockHabit(
          name: trimmedName,
          streakDays: 0,
          isCompleted: false,
          createdDate: DateTime.now(),
          color: state.color,
          frequencyType: state.frequencyType,
          weeklyDays: state.weeklyDays,
        ),
      );
      mockCompletionRecords[mockHabits.length - 1] = {};
    } else {
      final index = state.editingHabitIndex!;
      final existing = mockHabits[index];
      mockHabits[index] = MockHabit(
        name: trimmedName,
        streakDays: existing.streakDays,
        isCompleted: existing.isCompleted,
        createdDate: existing.createdDate,
        color: state.color,
        frequencyType: state.frequencyType,
        weeklyDays: state.weeklyDays,
      );
    }

    state = state.copyWith(isSaving: false);
  }

  /// 習慣を削除する。
  void delete() {
    final index = state.editingHabitIndex;
    if (index == null) return;

    mockHabits.removeAt(index);
    mockCompletionRecords.remove(index);

    // インデックスを詰める
    final updatedRecords = <int, Set<DateTime>>{};
    for (final entry in mockCompletionRecords.entries) {
      final newIndex = entry.key > index ? entry.key - 1 : entry.key;
      updatedRecords[newIndex] = entry.value;
    }
    mockCompletionRecords
      ..clear()
      ..addAll(updatedRecords);
  }

  /// フォームの内容が初期値から変更されているかどうか。
  bool get hasChanges {
    final initial = build(state.editingHabitIndex);
    return state.name != initial.name ||
        state.frequencyType != initial.frequencyType ||
        state.weeklyDays.length != initial.weeklyDays.length ||
        !state.weeklyDays.containsAll(initial.weeklyDays) ||
        state.color != initial.color;
  }
}
