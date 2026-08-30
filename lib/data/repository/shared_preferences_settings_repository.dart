import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/settings/app_theme_mode.dart';
import '../../domain/settings/settings_repository.dart';

/// SharedPreferencesを使用した設定リポジトリの実装。
class SharedPreferencesSettingsRepository implements SettingsRepository {
  SharedPreferencesSettingsRepository(this._prefs);

  final SharedPreferences _prefs;

  static const _timerSoundEnabledKey = 'timer_sound_enabled';
  static const _themeModeKey = 'theme_mode';

  @override
  Future<bool> getTimerSoundEnabled() async {
    return _prefs.getBool(_timerSoundEnabledKey) ?? true;
  }

  @override
  Future<void> setTimerSoundEnabled(bool enabled) async {
    await _prefs.setBool(_timerSoundEnabledKey, enabled);
  }

  @override
  Future<AppThemeMode> getThemeMode() async {
    final value = _prefs.getString(_themeModeKey);
    return AppThemeMode.fromString(value ?? '');
  }

  @override
  Future<void> setThemeMode(AppThemeMode themeMode) async {
    await _prefs.setString(_themeModeKey, themeMode.value);
  }
}
