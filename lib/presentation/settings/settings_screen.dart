import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../data/providers.dart';
import '../../domain/settings/app_theme_mode.dart';
import 'notifiers/theme_notifier.dart';

/// 設定画面。
class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  bool _timerSoundEnabled = true;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final repo = ref.read(settingsRepositoryProvider);
    final enabled = await repo.getTimerSoundEnabled();
    setState(() {
      _timerSoundEnabled = enabled;
      _isLoading = false;
    });
  }

  Future<void> _onTimerSoundChanged(bool value) async {
    setState(() => _timerSoundEnabled = value);
    final repo = ref.read(settingsRepositoryProvider);
    await repo.setTimerSoundEnabled(value);
  }

  void _showThemeModeDialog() {
    final currentMode =
        ref.read(themeNotifierProvider).valueOrNull ?? AppThemeMode.system;

    showDialog<AppThemeMode>(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: const Text('テーマ'),
          children: [
            RadioGroup<AppThemeMode>(
              groupValue: currentMode,
              onChanged: (selected) => Navigator.of(context).pop(selected),
              child: Column(
                children: AppThemeMode.values.map((mode) {
                  return RadioListTile<AppThemeMode>(
                    title: Text(mode.label),
                    value: mode,
                  );
                }).toList(),
              ),
            ),
          ],
        );
      },
    ).then((selected) {
      if (selected != null) {
        ref.read(themeNotifierProvider.notifier).setThemeMode(selected);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final appThemeMode = ref.watch(themeNotifierProvider).valueOrNull;
    final themeModeLabel = (appThemeMode ?? AppThemeMode.system).label;

    return Scaffold(
      appBar: AppBar(title: const Text('設定')),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              children: [
                ListTile(
                  title: const Text('テーマ'),
                  subtitle: Text(themeModeLabel),
                  onTap: _showThemeModeDialog,
                ),
                SwitchListTile(
                  title: const Text('タイマー完了サウンド'),
                  subtitle: const Text('タイマーが目標時間に達した時にサウンドを再生します'),
                  value: _timerSoundEnabled,
                  onChanged: _onTimerSoundChanged,
                ),
              ],
            ),
    );
  }
}
