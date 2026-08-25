import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/providers.dart';
import '../../../domain/habit/habit_category.dart';
import '../../../domain/result.dart';
import 'graph_state.dart';

part 'graph_notifier.g.dart';

/// グラフ画面の状態を管理するNotifier。
@riverpod
class Graph extends _$Graph {
  @override
  Future<GraphState> build() async {
    // テーブル変更を監視し、変更があれば自動で再ビルドする
    ref.watch(habitsTableChangedProvider);
    ref.watch(completionRecordsTableChangedProvider);

    final useCase = ref.read(getCategoryStatisticsUseCaseProvider);
    final result = await useCase();

    return switch (result) {
      Success(:final value) => GraphState(
        habitCountData: _toChartData(value.habitCounts),
        achievementCountData: _toChartData(value.achievementCounts),
      ),
      Failure(:final message) => throw Exception(message),
    };
  }

  /// カテゴリ別カウントをチャートデータに変換する。
  List<CategoryChartData> _toChartData(Map<HabitCategory?, int> counts) {
    return counts.entries
        .where((e) => e.value > 0)
        .map(
          (e) => CategoryChartData(
            category: e.key,
            label: e.key?.label ?? '未分類',
            colorValue: e.key?.colorValue ?? 0xFF9E9E9E,
            count: e.value,
          ),
        )
        .toList();
  }
}
