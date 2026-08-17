import 'package:drift/drift.dart';

import '../app_database.dart';
import '../tables/habits.dart';

part 'habit_dao.g.dart';

/// 習慣テーブルのDAO。
@DriftAccessor(tables: [Habits])
class HabitDao extends DatabaseAccessor<AppDatabase> with _$HabitDaoMixin {
  HabitDao(super.db);

  /// すべての習慣を取得する。
  Future<List<Habit>> getAll() => select(habits).get();

  /// IDで習慣を1件取得する。
  Future<Habit?> getById(int id) =>
      (select(habits)..where((t) => t.id.equals(id))).getSingleOrNull();

  /// 習慣を作成し、挿入された行を返す。
  Future<Habit> insert_(HabitsCompanion entry) async {
    final id = await into(habits).insert(entry);
    return (select(habits)..where((t) => t.id.equals(id))).getSingle();
  }

  /// 習慣を更新する。
  Future<bool> update_(HabitsCompanion entry) => update(habits).replace(entry);

  /// 習慣を削除する。
  Future<int> delete_(int id) =>
      (delete(habits)..where((t) => t.id.equals(id))).go();
}
