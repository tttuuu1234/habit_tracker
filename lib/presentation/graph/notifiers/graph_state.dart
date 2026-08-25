import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/habit/habit_category.dart';

part 'graph_state.freezed.dart';

/// 円グラフに表示する1セクションのデータ。
@freezed
abstract class CategoryChartData with _$CategoryChartData {
  const factory CategoryChartData({
    /// カテゴリ（nullは未分類）。
    required HabitCategory? category,

    /// 表示ラベル。
    required String label,

    /// カテゴリの色（ARGB int値）。
    required int colorValue,

    /// 件数。
    required int count,
  }) = _CategoryChartData;
}

/// グラフ画面の状態。
@freezed
abstract class GraphState with _$GraphState {
  const factory GraphState({
    /// カテゴリ別習慣数データ。
    required List<CategoryChartData> habitCountData,

    /// カテゴリ別達成回数データ。
    required List<CategoryChartData> achievementCountData,
  }) = _GraphState;
}
