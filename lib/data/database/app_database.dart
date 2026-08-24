import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../domain/habit/frequency_type.dart';
import '../../domain/habit/habit_type.dart';
import 'daos/completion_record_dao.dart';
import 'daos/habit_dao.dart';
import 'tables/completion_records.dart';
import 'tables/habits.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [Habits, CompletionRecords],
  daos: [HabitDao, CompletionRecordDao],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  /// テスト用コンストラクタ。
  AppDatabase.forTesting(super.e);

  @override
  int get schemaVersion => 3;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onCreate: (m) => m.createAll(),
        onUpgrade: (m, from, to) async {
          if (from < 2) {
            await m.addColumn(habits, habits.habitType);
            await m.addColumn(habits, habits.targetTime);
          }
          if (from < 3) {
            await m.addColumn(habits, habits.isArchived);
          }
        },
        beforeOpen: (details) async {
          await customStatement('PRAGMA foreign_keys = ON');
        },
      );
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'habit_tracker.db'));
    return NativeDatabase.createInBackground(file);
  });
}
