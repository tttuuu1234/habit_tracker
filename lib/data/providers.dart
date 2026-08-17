import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/habit/completion_record_repository.dart';
import '../domain/habit/habit_repository.dart';
import 'database/app_database.dart';
import 'database/daos/completion_record_dao.dart';
import 'database/daos/habit_dao.dart';
import 'repository/drift_completion_record_repository.dart';
import 'repository/drift_habit_repository.dart';

part 'providers.g.dart';

/// アプリケーションデータベースのインスタンス。
@Riverpod(keepAlive: true)
AppDatabase appDatabase(AppDatabaseRef ref) {
  final db = AppDatabase();
  ref.onDispose(db.close);
  return db;
}

/// 習慣リポジトリのインスタンス。
@Riverpod(keepAlive: true)
HabitRepository habitRepository(HabitRepositoryRef ref) {
  final db = ref.watch(appDatabaseProvider);
  return DriftHabitRepository(HabitDao(db));
}

/// 達成記録リポジトリのインスタンス。
@Riverpod(keepAlive: true)
CompletionRecordRepository completionRecordRepository(
  CompletionRecordRepositoryRef ref,
) {
  final db = ref.watch(appDatabaseProvider);
  return DriftCompletionRecordRepository(CompletionRecordDao(db));
}
