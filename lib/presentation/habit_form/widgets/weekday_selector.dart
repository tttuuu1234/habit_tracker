import 'package:flutter/material.dart';

/// 曜日トグル選択ウィジェット。
class WeekdaySelector extends StatelessWidget {
  const WeekdaySelector({
    super.key,
    required this.selectedDays,
    required this.onToggle,
  });

  /// 選択中の曜日（1=月〜7=日）。
  final Set<int> selectedDays;

  /// 曜日がトグルされたときのコールバック。
  final ValueChanged<int> onToggle;

  static const _weekdayLabels = ['月', '火', '水', '木', '金', '土', '日'];

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: List.generate(7, (index) {
        final day = index + 1; // 1=月〜7=日
        final isSelected = selectedDays.contains(day);

        return GestureDetector(
          onTap: () => onToggle(day),
          child: Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: isSelected ? colorScheme.primary : null,
              border: isSelected
                  ? null
                  : Border.all(color: colorScheme.outline),
              borderRadius: BorderRadius.circular(8),
            ),
            alignment: Alignment.center,
            child: Text(
              _weekdayLabels[index],
              style: TextStyle(
                color: isSelected
                    ? colorScheme.onPrimary
                    : colorScheme.onSurface,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        );
      }),
    );
  }
}
