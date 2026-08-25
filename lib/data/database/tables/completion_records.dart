import 'package:drift/drift.dart';

import 'habits.dart';

/// 達成記録テーブル。
class CompletionRecords extends Table {
  /// 自動採番の主キー。
  IntColumn get id => integer().autoIncrement()();

  /// 対象の習慣ID。
  IntColumn get habitId =>
      integer().references(Habits, #id, onDelete: KeyAction.cascade)();

  /// 達成した日付。
  DateTimeColumn get completedDate => dateTime()();

  @override
  List<Set<Column>> get uniqueKeys => [
    {habitId, completedDate},
  ];
}
