import 'app_theme_mode.dart';

/// アプリ設定のリポジトリインターフェース。
abstract class SettingsRepository {
  /// タイマー完了時のサウンドが有効かどうか。
  Future<bool> getTimerSoundEnabled();

  /// タイマー完了時のサウンドの有効/無効を設定する。
  Future<void> setTimerSoundEnabled(bool enabled);

  /// テーマモードを取得する。
  Future<AppThemeMode> getThemeMode();

  /// テーマモードを保存する。
  Future<void> setThemeMode(AppThemeMode themeMode);
}
