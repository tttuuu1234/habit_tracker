/// アプリ設定のリポジトリインターフェース。
abstract class SettingsRepository {
  /// タイマー完了時のサウンドが有効かどうか。
  Future<bool> getTimerSoundEnabled();

  /// タイマー完了時のサウンドの有効/無効を設定する。
  Future<void> setTimerSoundEnabled(bool enabled);
}
