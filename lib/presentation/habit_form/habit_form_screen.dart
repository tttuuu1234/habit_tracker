import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../domain/habit/frequency_type.dart';
import '../mock_data.dart';
import 'notifiers/habit_form_notifier.dart';
import 'widgets/color_palette.dart';
import 'widgets/frequency_selector.dart';
import 'widgets/weekday_selector.dart';

/// 習慣作成・編集画面。
class HabitFormScreen extends ConsumerStatefulWidget {
  const HabitFormScreen({
    super.key,
    this.editingHabitIndex,
  });

  /// 編集対象の習慣インデックス（nullなら作成モード）。
  final int? editingHabitIndex;

  @override
  ConsumerState<HabitFormScreen> createState() => _HabitFormScreenState();
}

class _HabitFormScreenState extends ConsumerState<HabitFormScreen> {
  late final TextEditingController _nameController;

  @override
  void initState() {
    super.initState();
    final initialName = widget.editingHabitIndex != null
        ? mockHabits[widget.editingHabitIndex!].name
        : '';
    _nameController = TextEditingController(text: initialName);
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  void _onSave() {
    final notifier = ref.read(
      habitFormProvider(widget.editingHabitIndex).notifier,
    );
    notifier.save();

    if (widget.editingHabitIndex != null) {
      // 編集モード: 詳細画面に戻る
      context.pop();
    } else {
      // 作成モード: ホーム画面に戻る
      context.pop();
    }
  }

  void _onDelete() {
    final state = ref.read(habitFormProvider(widget.editingHabitIndex));
    showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('習慣を削除'),
        content: Text(
          '「${state.name}」を削除しますか？達成記録もすべて削除されます。',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('キャンセル'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            style: FilledButton.styleFrom(
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
            child: const Text('削除'),
          ),
        ],
      ),
    ).then((confirmed) {
      if (confirmed != true) return;
      if (!mounted) return;

      ref.read(habitFormProvider(widget.editingHabitIndex).notifier).delete();
      // ホーム画面まで戻る
      context.go('/');
    });
  }

  Future<bool> _onWillPop() async {
    final notifier = ref.read(
      habitFormProvider(widget.editingHabitIndex).notifier,
    );
    if (!notifier.hasChanges) return true;

    final result = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('変更を破棄'),
        content: const Text('入力内容が破棄されますがよろしいですか？'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('キャンセル'),
          ),
          FilledButton(
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('破棄'),
          ),
        ],
      ),
    );

    return result ?? false;
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(habitFormProvider(widget.editingHabitIndex));
    final notifier = ref.read(
      habitFormProvider(widget.editingHabitIndex).notifier,
    );

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) return;
        final shouldPop = await _onWillPop();
        if (shouldPop && context.mounted) {
          context.pop();
        }
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(state.isCreateMode ? '習慣を追加' : '習慣を編集'),
          actions: [
            if (!state.isCreateMode)
              IconButton(
                icon: const Icon(Icons.delete_outline),
                color: Theme.of(context).colorScheme.error,
                onPressed: _onDelete,
              ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '習慣名',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.surface,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withValues(alpha: 0.06),
                            blurRadius: 6,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: TextField(
                        controller: _nameController,
                        maxLength: 30,
                        decoration: InputDecoration(
                          hintText: '例: 30分読書',
                          filled: true,
                          fillColor: Theme.of(context).colorScheme.surface,
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          counterText: '',
                        ),
                        onChanged: notifier.updateName,
                      ),
                    ),
                    const SizedBox(height: 24),
                    Text(
                      '頻度',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: 8),
                    SizedBox(
                      width: double.infinity,
                      child: FrequencySelector(
                        selected: state.frequencyType,
                        onChanged: notifier.updateFrequencyType,
                      ),
                    ),
                    if (state.frequencyType == FrequencyType.weekly) ...[
                      const SizedBox(height: 24),
                      Text(
                        '曜日',
                        style: Theme.of(context).textTheme.titleSmall,
                      ),
                      const SizedBox(height: 8),
                      WeekdaySelector(
                        selectedDays: state.weeklyDays,
                        onToggle: notifier.toggleWeekday,
                      ),
                    ],
                    const SizedBox(height: 24),
                    Text(
                      'カラー',
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    const SizedBox(height: 8),
                    ColorPalette(
                      selectedColor: state.color,
                      onColorSelected: notifier.updateColor,
                    ),
                  ],
                ),
              ),
            ),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                child: SizedBox(
                  width: double.infinity,
                  height: 48,
                  child: FilledButton(
                    onPressed:
                        state.isValid && !state.isSaving ? _onSave : null,
                    child: state.isSaving
                        ? const SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              color: Colors.white,
                            ),
                          )
                        : const Text('保存'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
