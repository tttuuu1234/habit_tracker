import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/settings/settings_repository.dart';

/// SharedPreferencesを使用した設定リポジトリの実装。
class SharedPreferencesSettingsRepository implements SettingsRepository {
  SharedPreferencesSettingsRepository(this._prefs);

  final SharedPreferences _prefs;

  static const _timerSoundEnabledKey = 'timer_sound_enabled';

  @override
  Future<bool> getTimerSoundEnabled() async {
    return _prefs.getBool(_timerSoundEnabledKey) ?? true;
  }

  @override
  Future<void> setTimerSoundEnabled(bool enabled) async {
    await _prefs.setBool(_timerSoundEnabledKey, enabled);
  }
}
