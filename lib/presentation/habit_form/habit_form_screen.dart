import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../domain/habit/frequency_type.dart';
import '../../domain/habit/habit_type.dart';
import '../home/notifiers/home_notifier.dart';
import 'notifiers/habit_form_notifier.dart';
import 'widgets/color_palette.dart';
import 'widgets/frequency_selector.dart';
import 'widgets/habit_type_selector.dart';
import 'widgets/weekday_selector.dart';

/// 習慣作成・編集画面。
class HabitFormScreen extends ConsumerStatefulWidget {
  const HabitFormScreen({
    super.key,
    this.editingHabitId,
  });

  /// 編集対象の習慣ID（nullなら作成モード）。
  final int? editingHabitId;

  @override
  ConsumerState<HabitFormScreen> createState() => _HabitFormScreenState();
}

class _HabitFormScreenState extends ConsumerState<HabitFormScreen> {
  final _nameController = TextEditingController();
  final _targetTimeController = TextEditingController();
  bool _nameInitialized = false;

  @override
  void dispose() {
    _nameController.dispose();
    _targetTimeController.dispose();
    super.dispose();
  }

  Future<void> _onSave() async {
    final notifier = ref.read(
      habitFormProvider(widget.editingHabitId).notifier,
    );
    await notifier.save();

    if (!mounted) return;
    ref.invalidate(homeProvider);
    context.pop();
  }

  void _onDelete() {
    final formState = ref.read(habitFormProvider(widget.editingHabitId));
    final name = formState.value?.name ?? '';

    showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('習慣を削除'),
        content: Text(
          '「$name」を削除しますか？達成記録もすべて削除されます。',
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
    ).then((confirmed) async {
      if (confirmed != true) return;
      if (!mounted) return;

      await ref
          .read(habitFormProvider(widget.editingHabitId).notifier)
          .delete();

      if (!mounted) return;
      context.pop(widget.editingHabitId);
    });
  }

  Future<bool> _onWillPop() async {
    final notifier = ref.read(
      habitFormProvider(widget.editingHabitId).notifier,
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
    final asyncState = ref.watch(habitFormProvider(widget.editingHabitId));

    return asyncState.when(
      loading: () => Scaffold(
        appBar: AppBar(title: const Text('')),
        body: const Center(child: CircularProgressIndicator()),
      ),
      error: (error, _) => Scaffold(
        appBar: AppBar(),
        body: Center(child: Text('エラー: $error')),
      ),
      data: (state) {
        // 初回データ到着時にテキストコントローラーを初期化
        if (!_nameInitialized) {
          _nameController.text = state.name;
          if (state.targetTime != null) {
            _targetTimeController.text = state.targetTime.toString();
          }
          _nameInitialized = true;
        }

        final notifier = ref.read(
          habitFormProvider(widget.editingHabitId).notifier,
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
                                color:
                                    Colors.black.withValues(alpha: 0.06),
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
                              fillColor:
                                  Theme.of(context).colorScheme.surface,
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
                          '種類',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          width: double.infinity,
                          child: HabitTypeSelector(
                            selected: state.habitType,
                            onChanged: notifier.updateHabitType,
                          ),
                        ),
                        if (state.habitType == HabitType.time) ...[
                          const SizedBox(height: 24),
                          Text(
                            '目標時間（分）',
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          const SizedBox(height: 8),
                          Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surface,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      Colors.black.withValues(alpha: 0.06),
                                  blurRadius: 6,
                                  offset: const Offset(0, 2),
                                ),
                              ],
                            ),
                            child: TextField(
                              controller: _targetTimeController,
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                hintText: '例: 30',
                                suffixText: '分',
                                filled: true,
                                fillColor:
                                    Theme.of(context).colorScheme.surface,
                                border: OutlineInputBorder(
                                  borderSide: BorderSide.none,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onChanged: (value) {
                                final parsed = int.tryParse(value);
                                notifier.updateTargetTime(parsed);
                              },
                            ),
                          ),
                        ],
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
                        if (state.frequencyType ==
                            FrequencyType.weekly) ...[
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
                        onPressed: state.isValid && !state.isSaving
                            ? _onSave
                            : null,
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
      },
    );
  }
}
