import 'package:freezed_annotation/freezed_annotation.dart';

import 'habit_summary.dart';

part 'home_state.freezed.dart';

/// ホーム画面の状態。
@freezed
abstract class HomeState with _$HomeState {
  const factory HomeState({
    /// 習慣サマリーのリスト。
    @Default([]) List<HabitSummary> habits,

    /// 読み込み中かどうか。
    @Default(false) bool isLoading,

    /// エラーメッセージ。
    @Default(null) String? errorMessage,

    /// 達成済みセクションが折りたたまれているかどうか。
    @Default(false) bool isCompletedSectionCollapsed,
  }) = _HomeState;
}
