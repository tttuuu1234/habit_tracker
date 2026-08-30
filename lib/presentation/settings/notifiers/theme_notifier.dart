import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../data/providers.dart';
import '../../../domain/settings/app_theme_mode.dart';

part 'theme_notifier.g.dart';

/// テーマモードを管理するNotifier。
@Riverpod(keepAlive: true)
class ThemeNotifier extends _$ThemeNotifier {
  @override
  Future<AppThemeMode> build() async {
    final repo = ref.read(settingsRepositoryProvider);
    return repo.getThemeMode();
  }

  /// テーマモードを変更して永続化する。
  Future<void> setThemeMode(AppThemeMode mode) async {
    state = AsyncData(mode);
    final repo = ref.read(settingsRepositoryProvider);
    await repo.setThemeMode(mode);
  }
}

/// AppThemeModeをFlutterのThemeModeに変換する拡張。
extension AppThemeModeX on AppThemeMode {
  /// FlutterのThemeModeに変換する。
  ThemeMode toThemeMode() {
    return switch (this) {
      AppThemeMode.system => ThemeMode.system,
      AppThemeMode.light => ThemeMode.light,
      AppThemeMode.dark => ThemeMode.dark,
    };
  }
}
