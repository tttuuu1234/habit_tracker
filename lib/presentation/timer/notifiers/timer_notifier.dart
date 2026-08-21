import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/providers.dart';
import '../../../domain/result.dart';
import 'timer_state.dart';

part 'timer_notifier.g.dart';

/// タイマー画面の状態を管理するNotifier。
@riverpod
class HabitTimer extends _$HabitTimer {
  Timer? _timer;
  late int _habitId;

  @override
  Future<TimerState> build(int habitId) async {
    _habitId = habitId;
    ref.onDispose(() => _timer?.cancel());

    final repo = ref.read(habitRepositoryProvider);
    final result = await repo.getById(habitId);

    return switch (result) {
      Success(:final value) => TimerState(
        habitName: value.name,
        targetSeconds: (value.targetTime ?? 0) * 60,
        remainingSeconds: (value.targetTime ?? 0) * 60,
      ),
      Failure(:final message) => throw Exception(message),
    };
  }

  /// タイマーを開始する。
  void start() {
    final currentState = state.value;
    if (currentState == null || currentState.isRunning) return;

    state = AsyncData(currentState.copyWith(isRunning: true));

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final s = state.value;
      if (s == null) return;

      final newRemaining = s.remainingSeconds - 1;
      if (newRemaining <= 0) {
        _timer?.cancel();
        state = AsyncData(
          s.copyWith(remainingSeconds: 0, isRunning: false, isCompleted: true),
        );
        _recordCompletion();
        return;
      }

      state = AsyncData(s.copyWith(remainingSeconds: newRemaining));
    });
  }

  /// タイマーを一時停止する。
  void pause() {
    _timer?.cancel();
    final currentState = state.value;
    if (currentState == null) return;
    state = AsyncData(currentState.copyWith(isRunning: false));
  }

  /// 達成記録を保存する。
  Future<void> _recordCompletion() async {
    final completionRepo = ref.read(completionRecordRepositoryProvider);
    final today = DateTime.now();
    final normalizedToday = DateTime(today.year, today.month, today.day);
    await completionRepo.addCompletion(_habitId, normalizedToday);
  }
}
