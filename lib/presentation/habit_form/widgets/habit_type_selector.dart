import 'package:flutter/material.dart';

import '../../../domain/habit/habit_type.dart';

/// 習慣種別選択セグメントコントロール。
///
/// グレー背景に白いピルがスライドして切り替わるタブ形式。
class HabitTypeSelector extends StatelessWidget {
  const HabitTypeSelector({
    super.key,
    required this.selected,
    required this.onChanged,
  });

  final HabitType selected;
  final ValueChanged<HabitType> onChanged;

  static const _labels = {
    HabitType.check: 'チェック',
    HabitType.time: '時間',
  };

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final containerColor = colorScheme.onSurface.withValues(alpha: 0.12);
    final selectedIndex = HabitType.values.indexOf(selected);

    return Container(
      decoration: BoxDecoration(
        color: containerColor,
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(4),
      child: LayoutBuilder(
        builder: (context, constraints) {
          final segmentWidth =
              (constraints.maxWidth) / HabitType.values.length;

          return Stack(
            children: [
              // スライドする白いピル
              AnimatedPositioned(
                duration: const Duration(milliseconds: 200),
                curve: Curves.easeInOut,
                left: segmentWidth * selectedIndex,
                top: 0,
                bottom: 0,
                width: segmentWidth,
                child: Container(
                  decoration: BoxDecoration(
                    color: colorScheme.surface,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withValues(alpha: 0.08),
                        blurRadius: 4,
                        offset: const Offset(0, 1),
                      ),
                    ],
                  ),
                ),
              ),
              // テキストラベル
              Row(
                children: HabitType.values.map((type) {
                  final isSelected = selected == type;
                  return Expanded(
                    child: GestureDetector(
                      onTap: () => onChanged(type),
                      behavior: HitTestBehavior.opaque,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: Center(
                          child: Text(
                            _labels[type]!,
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: isSelected
                                  ? FontWeight.w600
                                  : FontWeight.normal,
                              color: colorScheme.onSurface,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          );
        },
      ),
    );
  }
}
