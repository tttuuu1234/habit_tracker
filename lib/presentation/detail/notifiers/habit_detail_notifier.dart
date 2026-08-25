import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/providers.dart';
import '../../../domain/result.dart';
import 'habit_detail_state.dart';

part 'habit_detail_notifier.g.dart';

/// 習慣詳細画面の状態を管理するNotifier。
@riverpod
class HabitDetail extends _$HabitDetail {
  /// リポジトリから習慣情報と達成記録を取得し、初期状態を生成する。
  @override
  Future<HabitDetailState> build(int habitId) async {
    final habitRepo = ref.read(habitRepositoryProvider);
    final completionRepo = ref.read(completionRecordRepositoryProvider);
    final habitResult = await habitRepo.getById(habitId);

    return switch (habitResult) {
      Success(:final value) => () async {
        final completionResult = await completionRepo.getCompletionDates(
          habitId,
        );
        final completionDates = switch (completionResult) {
          Success(:final value) => value,
          Failure() => <DateTime>{},
        };
        final now = DateTime.now();
        final habitColor = value.category != null
            ? Color(value.category!.colorValue)
            : null;

        return HabitDetailState(
          habitName: value.name,
          habitCreatedDate: value.createdDate,
          habitColor: habitColor,
          completionDates: completionDates,
          displayMonth: DateTime(now.year, now.month),
          isArchived: value.isArchived,
        );
      }(),
      Failure(:final message) => throw Exception(message),
    };
  }

  /// 習慣のアーカイブ状態を切り替える。
  Future<Result<void>> toggleArchive() async {
    final currentState = state.value;
    if (currentState == null) return const Result.failure('状態が取得できません');

    final habitRepo = ref.read(habitRepositoryProvider);
    final habitResult = await habitRepo.getById(habitId);

    return switch (habitResult) {
      Success(:final value) => () async {
        final updated = value.copyWith(isArchived: !value.isArchived);
        final updateResult = await habitRepo.update(updated);
        if (updateResult is Success) {
          state = AsyncData(
            currentState.copyWith(isArchived: updated.isArchived),
          );
        }
        return updateResult;
      }(),
      Failure(:final message) => Result.failure(message),
    };
  }

  /// カレンダーの表示月を前月に切り替える。
  void goToPreviousMonth() {
    final currentState = state.value;
    if (currentState == null) return;
    final current = currentState.displayMonth;
    state = AsyncData(
      currentState.copyWith(
        displayMonth: DateTime(current.year, current.month - 1),
      ),
    );
  }

  /// カレンダーの表示月を翌月に切り替える。
  void goToNextMonth() {
    final currentState = state.value;
    if (currentState == null) return;
    final current = currentState.displayMonth;
    state = AsyncData(
      currentState.copyWith(
        displayMonth: DateTime(current.year, current.month + 1),
      ),
    );
  }
}
