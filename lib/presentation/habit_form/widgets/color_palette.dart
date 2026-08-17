import 'package:flutter/material.dart';

/// プリセットカラーパレット。
class ColorPalette extends StatelessWidget {
  const ColorPalette({
    super.key,
    required this.selectedColor,
    required this.onColorSelected,
  });

  /// 選択中のカラー。
  final Color? selectedColor;

  /// カラーが選択されたときのコールバック。
  final ValueChanged<Color> onColorSelected;

  static final presetColors = [
    Colors.green.shade700,
    Colors.blue.shade600,
    Colors.purple.shade600,
    Colors.orange.shade700,
    Colors.red.shade600,
    Colors.pink.shade400,
    Colors.teal.shade600,
    Colors.amber.shade700,
  ];

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: presetColors.map((color) {
        final isSelected = selectedColor == color;
        return GestureDetector(
          onTap: () => onColorSelected(color),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            width: 44,
            height: 44,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: isSelected ? color : Colors.transparent,
                width: 2.5,
              ),
            ),
            padding: EdgeInsets.all(isSelected ? 3 : 0),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(
                  isSelected ? 6 : 10,
                ),
              ),
              child: Center(
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 200),
                  opacity: isSelected ? 1.0 : 0.0,
                  child: const Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    );
  }
}
