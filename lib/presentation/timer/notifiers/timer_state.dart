import 'package:freezed_annotation/freezed_annotation.dart';

part 'timer_state.freezed.dart';

/// タイマー画面の状態。
@freezed
abstract class TimerState with _$TimerState {
  const TimerState._();

  const factory TimerState({
    /// 習慣名。
    required String habitName,

    /// 目標時間（秒）。
    required int targetSeconds,

    /// 残り時間（秒）。
    required int remainingSeconds,

    /// タイマー実行中かどうか。
    @Default(false) bool isRunning,

    /// タイマーが完了したかどうか。
    @Default(false) bool isCompleted,

    /// タイマー終了予定時刻。
    DateTime? endAt,

    /// バックグラウンド移行時刻。
    DateTime? pausedAt,
  }) = _TimerState;

  /// 進捗率（0.0〜1.0）。
  double get progress {
    if (targetSeconds == 0) return 1.0;
    return 1.0 - (remainingSeconds / targetSeconds);
  }

  /// 残り時間の表示用テキスト（MM:SS形式）。
  String get displayTime {
    final minutes = remainingSeconds ~/ 60;
    final seconds = remainingSeconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
  }
}
