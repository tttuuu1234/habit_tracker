import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/providers.dart';
import '../../../domain/habit/frequency_type.dart';
import '../../../domain/result.dart';
import 'habit_form_state.dart';

part 'habit_form_notifier.g.dart';

/// 習慣作成・編集フォームの状態を管理するNotifier。
@riverpod
class HabitForm extends _$HabitForm {
  HabitFormState? _initialState;

  /// 初期状態を生成する。editingHabitIdがnullなら作成モード。
  @override
  Future<HabitFormState> build(int? editingHabitId) async {
    if (editingHabitId == null) {
      const initial = HabitFormState();
      _initialState = initial;
      return initial;
    }

    final repo = ref.read(habitRepositoryProvider);
    final result = await repo.getById(editingHabitId);

    return switch (result) {
      Success(:final value) => () {
          final initial = HabitFormState(
            name: value.name,
            frequencyType: value.frequencyType,
            weeklyDays: value.weeklyDays,
            color:
                value.colorValue != null ? Color(value.colorValue!) : null,
            editingHabitId: editingHabitId,
          );
          _initialState = initial;
          return initial;
        }(),
      Failure(:final message) => throw Exception(message),
    };
  }

  /// 習慣名を更新する。
  void updateName(String name) {
    final currentState = state.value;
    if (currentState == null) return;
    state = AsyncData(currentState.copyWith(name: name));
  }

  /// 頻度種別を更新する。
  void updateFrequencyType(FrequencyType frequencyType) {
    final currentState = state.value;
    if (currentState == null) return;
    state = AsyncData(currentState.copyWith(frequencyType: frequencyType));
  }

  /// 曜日の選択状態をトグルする。
  void toggleWeekday(int day) {
    final currentState = state.value;
    if (currentState == null) return;
    final days = Set<int>.from(currentState.weeklyDays);
    if (days.contains(day)) {
      days.remove(day);
    } else {
      days.add(day);
    }
    state = AsyncData(currentState.copyWith(weeklyDays: days));
  }

  /// カラーを更新する。
  void updateColor(Color? color) {
    final currentState = state.value;
    if (currentState == null) return;
    state = AsyncData(currentState.copyWith(color: color));
  }

  /// 習慣を保存する。作成モードならリストに追加、編集モードなら更新。
  Future<void> save() async {
    final currentState = state.value;
    if (currentState == null) return;
    if (!currentState.isValid || currentState.isSaving) return;

    state = AsyncData(currentState.copyWith(isSaving: true));

    final repo = ref.read(habitRepositoryProvider);
    final trimmedName = currentState.name.trim();
    final colorValue = currentState.color?.toARGB32();

    if (currentState.isCreateMode) {
      await repo.create(
        name: trimmedName,
        createdDate: DateTime.now(),
        colorValue: colorValue,
        frequencyType: currentState.frequencyType,
        weeklyDays: currentState.weeklyDays,
      );
    } else {
      final habitResult = await repo.getById(currentState.editingHabitId!);
      if (habitResult case Success(:final value)) {
        await repo.update(
          value.copyWith(
            name: trimmedName,
            colorValue: colorValue,
            frequencyType: currentState.frequencyType,
            weeklyDays: currentState.weeklyDays,
          ),
        );
      }
    }

    state = AsyncData(currentState.copyWith(isSaving: false));
  }

  /// 習慣を削除する。
  Future<void> delete() async {
    final currentState = state.value;
    if (currentState == null) return;
    final id = currentState.editingHabitId;
    if (id == null) return;

    final repo = ref.read(habitRepositoryProvider);
    await repo.delete(id);
  }

  /// フォームの内容が初期値から変更されているかどうか。
  bool get hasChanges {
    final currentState = state.value;
    if (currentState == null || _initialState == null) return false;
    final initial = _initialState!;
    return currentState.name != initial.name ||
        currentState.frequencyType != initial.frequencyType ||
        currentState.weeklyDays.length != initial.weeklyDays.length ||
        !currentState.weeklyDays.containsAll(initial.weeklyDays) ||
        currentState.color != initial.color;
  }
}
