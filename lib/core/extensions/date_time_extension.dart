import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  /// 日付を `'8月14日 木曜'` 形式で返す。
  String toDisplayDate() {
    return DateFormat('M月d日 EEEE', 'ja').format(this);
  }
}
