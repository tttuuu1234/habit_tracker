/// 習慣のカテゴリ。
enum HabitCategory {
  /// 運動。
  exercise(label: '運動', colorValue: 0xFF4CAF50),

  /// 勉強。
  study(label: '勉強', colorValue: 0xFF2196F3),

  /// 健康。
  health(label: '健康', colorValue: 0xFFFF9800),

  /// 仕事。
  work(label: '仕事', colorValue: 0xFF9C27B0),

  /// 趣味。
  hobby(label: '趣味', colorValue: 0xFFE91E63),

  /// 生活。
  lifestyle(label: '生活', colorValue: 0xFF009688),

  /// メンタル。
  mental(label: 'メンタル', colorValue: 0xFF3F51B5),

  /// その他。
  other(label: 'その他', colorValue: 0xFF607D8B);

  const HabitCategory({required this.label, required this.colorValue});

  /// カテゴリの日本語名。
  final String label;

  /// カテゴリの固定色（ARGB int値）。
  final int colorValue;
}
