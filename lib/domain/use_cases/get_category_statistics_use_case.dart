import 'package:freezed_annotation/freezed_annotation.dart';

import '../completion_record/completion_record_repository.dart';
import '../habit/habit_category.dart';
import '../habit/habit_repository.dart';
import '../result.dart';

part 'get_category_statistics_use_case.freezed.dart';

/// カテゴリ別統計データ。
@freezed
abstract class CategoryStatistics with _$CategoryStatistics {
  const factory CategoryStatistics({
    /// カテゴリ別の習慣数。
    required Map<HabitCategory?, int> habitCounts,

    /// カテゴリ別の達成回数合計。
    required Map<HabitCategory?, int> achievementCounts,
  }) = _CategoryStatistics;
}

/// カテゴリ別の統計を集計するユースケース。
class GetCategoryStatisticsUseCase {
  GetCategoryStatisticsUseCase(
    this._habitRepository,
    this._completionRecordRepository,
  );

  final HabitRepository _habitRepository;
  final CompletionRecordRepository _completionRecordRepository;

  /// アクティブ習慣のカテゴリ別統計を取得する。
  Future<Result<CategoryStatistics>> call() async {
    final habitsResult = await _habitRepository.getActive();

    return switch (habitsResult) {
      Success(:final value) => () async {
        final habitCounts = <HabitCategory?, int>{};
        final achievementCounts = <HabitCategory?, int>{};

        for (final habit in value) {
          habitCounts[habit.category] = (habitCounts[habit.category] ?? 0) + 1;

          final completionResult = await _completionRecordRepository
              .getCompletionDates(habit.id);
          final count = switch (completionResult) {
            Success(:final value) => value.length,
            Failure() => 0,
          };
          achievementCounts[habit.category] =
              (achievementCounts[habit.category] ?? 0) + count;
        }

        return Result.success(
          CategoryStatistics(
            habitCounts: habitCounts,
            achievementCounts: achievementCounts,
          ),
        );
      }(),
      Failure(:final message) => Result.failure(message),
    };
  }
}
