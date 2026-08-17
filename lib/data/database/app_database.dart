import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

import '../../domain/habit/frequency_type.dart';
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
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
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
