import '../../domain/habit/completion_record_repository.dart';
import '../../domain/result.dart';
import '../database/app_database.dart';
import '../database/daos/completion_record_dao.dart';

/// driftを使用した達成記録リポジトリの実装。
class DriftCompletionRecordRepository implements CompletionRecordRepository {
  DriftCompletionRecordRepository(this._completionRecordDao);

  final CompletionRecordDao _completionRecordDao;

  @override
  Future<Result<Set<DateTime>>> getCompletionDates(int habitId) async {
    try {
      final records = await _completionRecordDao.getByHabitId(habitId);
      final dates =
          records.map((r) => _normalizeDate(r.completedDate)).toSet();
      return Result.success(dates);
    } on Exception catch (e) {
      return Result.failure(e.toString());
    }
  }

  @override
  Future<Result<void>> addCompletion(int habitId, DateTime date) async {
    try {
      final normalizedDate = _normalizeDate(date);
      final entry = CompletionRecordsCompanion.insert(
        habitId: habitId,
        completedDate: normalizedDate,
      );
      await _completionRecordDao.insert_(entry);
      return const Result.success(null);
    } on Exception catch (e) {
      return Result.failure(e.toString());
    }
  }

  @override
  Future<Result<void>> removeCompletion(int habitId, DateTime date) async {
    try {
      final normalizedDate = _normalizeDate(date);
      await _completionRecordDao.delete_(habitId, normalizedDate);
      return const Result.success(null);
    } on Exception catch (e) {
      return Result.failure(e.toString());
    }
  }

  @override
  Future<bool> isCompletedOn(int habitId, DateTime date) async {
    final normalizedDate = _normalizeDate(date);
    return _completionRecordDao.isCompletedOn(habitId, normalizedDate);
  }

  DateTime _normalizeDate(DateTime dt) => DateTime(dt.year, dt.month, dt.day);
}
