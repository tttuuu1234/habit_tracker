import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/completion_records.dart';

part 'completion_record_dao.g.dart';

/// 達成記録テーブルのDAO。
@DriftAccessor(tables: [CompletionRecords])
class CompletionRecordDao extends DatabaseAccessor<AppDatabase>
    with _$CompletionRecordDaoMixin {
  CompletionRecordDao(super.db);

  /// 達成記録テーブルの変更を監視する。
  Stream<List<CompletionRecord>> watchAll() => select(completionRecords).watch();

  /// 指定した習慣の達成記録を取得する。
  Future<List<CompletionRecord>> getByHabitId(int habitId) =>
      (select(completionRecords)..where((t) => t.habitId.equals(habitId)))
          .get();

  /// 達成記録を追加する。
  Future<void> insert_(CompletionRecordsCompanion entry) =>
      into(completionRecords).insert(entry);

  /// 達成記録を削除する。
  Future<int> delete_(int habitId, DateTime date) =>
      (delete(completionRecords)
            ..where(
              (t) =>
                  t.habitId.equals(habitId) & t.completedDate.equals(date),
            ))
          .go();

  /// 指定日に達成済みかどうか。
  Future<bool> isCompletedOn(int habitId, DateTime date) async {
    final query = select(completionRecords)
      ..where(
        (t) => t.habitId.equals(habitId) & t.completedDate.equals(date),
      );
    final result = await query.getSingleOrNull();
    return result != null;
  }
}
