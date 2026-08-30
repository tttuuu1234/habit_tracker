/// アプリのテーマモード。
enum AppThemeMode {
  /// システム設定に従う。
  system('system', 'システム設定に従う'),

  /// ライトモード。
  light('light', 'ライト'),

  /// ダークモード。
  dark('dark', 'ダーク');

  const AppThemeMode(this.value, this.label);

  /// SharedPreferencesに保存する文字列値。
  final String value;

  /// 画面に表示するラベル。
  final String label;

  /// 文字列からAppThemeModeを取得する。
  static AppThemeMode fromString(String value) {
    return AppThemeMode.values.firstWhere(
      (e) => e.value == value,
      orElse: () => AppThemeMode.system,
    );
  }
}
