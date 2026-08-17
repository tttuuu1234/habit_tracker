import '../result.dart';

/// 達成記録のリポジトリインターフェース。
abstract class CompletionRecordRepository {
  /// 指定した習慣の達成日一覧を取得する。
  Future<Result<Set<DateTime>>> getCompletionDates(int habitId);

  /// 達成記録を追加する。
  Future<Result<void>> addCompletion(int habitId, DateTime date);

  /// 達成記録を削除する。
  Future<Result<void>> removeCompletion(int habitId, DateTime date);

  /// 指定日に達成済みかどうか。
  Future<bool> isCompletedOn(int habitId, DateTime date);
}
