import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../domain/completion_record/completion_record_repository.dart';
import '../domain/habit/habit_repository.dart';
import '../domain/settings/settings_repository.dart';
import '../domain/use_cases/get_category_statistics_use_case.dart';
import 'database/app_database.dart';
import 'database/daos/completion_record_dao.dart';
import 'database/daos/habit_dao.dart';
import 'repository/drift_completion_record_repository.dart';
import 'repository/drift_habit_repository.dart';
import 'repository/shared_preferences_settings_repository.dart';

part 'providers.g.dart';

/// SharedPreferencesのインスタンス。main.dartでoverrideして使用する。
final sharedPreferencesProvider = Provider<SharedPreferences>(
  (_) => throw UnimplementedError('sharedPreferencesProvider must be overridden'),
);

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

/// 習慣テーブルの変更を監視するストリーム。
@riverpod
Stream<void> habitsTableChanged(HabitsTableChangedRef ref) {
  final db = ref.watch(appDatabaseProvider);
  return HabitDao(db).watchActive().map((_) {});
}

/// 達成記録テーブルの変更を監視するストリーム。
@riverpod
Stream<void> completionRecordsTableChanged(
  CompletionRecordsTableChangedRef ref,
) {
  final db = ref.watch(appDatabaseProvider);
  return CompletionRecordDao(db).watchAll().map((_) {});
}

/// 設定リポジトリのインスタンス。
@Riverpod(keepAlive: true)
SettingsRepository settingsRepository(SettingsRepositoryRef ref) {
  final prefs = ref.watch(sharedPreferencesProvider);
  return SharedPreferencesSettingsRepository(prefs);
}

/// FlutterRingtonePlayerのインスタンス。
@Riverpod(keepAlive: true)
FlutterRingtonePlayer flutterRingtonePlayer(FlutterRingtonePlayerRef ref) {
  return FlutterRingtonePlayer();
}

/// カテゴリ別統計ユースケースのインスタンス。
@riverpod
GetCategoryStatisticsUseCase getCategoryStatisticsUseCase(GetCategoryStatisticsUseCaseRef ref) {
  return GetCategoryStatisticsUseCase(
    ref.watch(habitRepositoryProvider),
    ref.watch(completionRecordRepositoryProvider),
  );
}
