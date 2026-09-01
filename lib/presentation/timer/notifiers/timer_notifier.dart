import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/providers.dart';
import '../../../data/providers.dart';
import '../../../domain/result.dart';
import 'timer_state.dart';

part 'timer_notifier.g.dart';

/// タイマー画面の状態を管理するNotifier。
@Riverpod(keepAlive: true)
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

    _startLiveActivity(currentState);

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
    _updateLiveActivity(currentState.remainingSeconds, isPaused: true);
  }

  /// バックグラウンド移行時にタイマーを中断する。
  void onBackground() {
    final currentState = state.value;
    if (currentState == null ||
        !currentState.isRunning ||
        currentState.pausedAt != null) {
      return;
    }

    _timer?.cancel();
    state = AsyncData(currentState.copyWith(pausedAt: DateTime.now()));
    // Live Activityはバックグラウンドでもカウントダウンを続ける
  }

  /// フォアグラウンド復帰時にバックグラウンド中の経過時間を反映する。
  void onForeground() {
    final currentState = state.value;
    if (currentState == null || currentState.pausedAt == null) return;

    final elapsed = DateTime.now().difference(currentState.pausedAt!).inSeconds;
    final newRemaining = currentState.remainingSeconds - elapsed;

    if (newRemaining <= 0) {
      state = AsyncData(
        currentState.copyWith(
          remainingSeconds: 0,
          isRunning: false,
          isCompleted: true,
          pausedAt: null,
        ),
      );
      _recordCompletion();
      return;
    }

    state = AsyncData(
      currentState.copyWith(remainingSeconds: newRemaining, pausedAt: null),
    );
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final s = state.value;
      if (s == null) return;

      final remaining = s.remainingSeconds - 1;
      if (remaining <= 0) {
        _timer?.cancel();
        state = AsyncData(
          s.copyWith(remainingSeconds: 0, isRunning: false, isCompleted: true),
        );
        _recordCompletion();
        return;
      }

      state = AsyncData(s.copyWith(remainingSeconds: remaining));
    });
  }

  /// 達成記録を保存し、設定に応じてサウンドを再生する。
  Future<void> _recordCompletion() async {
    _endLiveActivity();

    final completionRepo = ref.read(completionRecordRepositoryProvider);
    final today = DateTime.now();
    final normalizedToday = DateTime(today.year, today.month, today.day);
    await completionRepo.addCompletion(_habitId, normalizedToday);

    final settingsRepo = ref.read(settingsRepositoryProvider);
    final soundEnabled = await settingsRepo.getTimerSoundEnabled();
    if (soundEnabled) {
      final player = ref.read(flutterRingtonePlayerProvider);
      player.playAlarm();
    }
  }

  /// Live Activityを開始する。
  void _startLiveActivity(TimerState timerState) {
    final liveActivityService = ref.read(liveActivityServiceProvider);
    liveActivityService.startActivity(
      habitId: _habitId,
      habitName: timerState.habitName,
      targetSeconds: timerState.targetSeconds,
      remainingSeconds: timerState.remainingSeconds,
    );
  }

  /// Live Activityを更新する。
  void _updateLiveActivity(int remainingSeconds, {required bool isPaused}) {
    final liveActivityService = ref.read(liveActivityServiceProvider);
    liveActivityService.updateActivity(
      habitId: _habitId,
      remainingSeconds: remainingSeconds,
      isPaused: isPaused,
    );
  }

  /// Live Activityを終了する。
  void _endLiveActivity() {
    final liveActivityService = ref.read(liveActivityServiceProvider);
    liveActivityService.endActivity(habitId: _habitId);
  }
}
