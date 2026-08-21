import 'package:habit_tracker/domain/completion_record/completion_record_repository.dart';
import 'package:habit_tracker/domain/result.dart';

/// テスト用の達成記録リポジトリ実装。
class FakeCompletionRecordRepository implements CompletionRecordRepository {
  final Map<int, Set<DateTime>> _completions = {};

  /// テスト用に達成記録を直接追加する。
  void addCompletionDates(int habitId, Set<DateTime> dates) {
    _completions.putIfAbsent(habitId, () => {});
    _completions[habitId]!.addAll(dates);
  }

  @override
  Future<Result<Set<DateTime>>> getCompletionDates(int habitId) async {
    final dates = _completions[habitId];
    if (dates == null) {
      return const Result.success({});
    }
    return Result.success(Set.unmodifiable(dates));
  }

  @override
  Future<Result<void>> addCompletion(int habitId, DateTime date) async {
    final normalized = DateTime(date.year, date.month, date.day);
    _completions.putIfAbsent(habitId, () => {});
    _completions[habitId]!.add(normalized);
    return const Result.success(null);
  }

  @override
  Future<Result<void>> removeCompletion(int habitId, DateTime date) async {
    final normalized = DateTime(date.year, date.month, date.day);
    _completions[habitId]?.remove(normalized);
    return const Result.success(null);
  }

  @override
  Future<bool> isCompletedOn(int habitId, DateTime date) async {
    final normalized = DateTime(date.year, date.month, date.day);
    return _completions[habitId]?.contains(normalized) ?? false;
  }
}
