import 'package:drift/drift.dart';

import '../../../domain/habit/frequency_type.dart';

/// FrequencyType ↔ String の変換。
class FrequencyTypeConverter extends TypeConverter<FrequencyType, String> {
  const FrequencyTypeConverter();

  @override
  FrequencyType fromSql(String fromDb) => FrequencyType.values.byName(fromDb);

  @override
  String toSql(FrequencyType value) => value.name;
}

/// `Set<int>` ↔ カンマ区切りString の変換。
class WeeklyDaysConverter extends TypeConverter<Set<int>, String> {
  const WeeklyDaysConverter();

  @override
  Set<int> fromSql(String fromDb) {
    if (fromDb.isEmpty) return {};
    return fromDb.split(',').map(int.parse).toSet();
  }

  @override
  String toSql(Set<int> value) {
    if (value.isEmpty) return '';
    final sorted = value.toList()..sort();
    return sorted.join(',');
  }
}

/// 習慣テーブル。
class Habits extends Table {
  /// 自動採番の主キー。
  IntColumn get id => integer().autoIncrement()();

  /// 習慣名。
  TextColumn get name => text().withLength(min: 1, max: 30)();

  /// 登録日。
  DateTimeColumn get createdDate => dateTime()();

  /// テーマカラーの値。
  IntColumn get colorValue => integer().nullable()();

  /// 頻度種別。
  TextColumn get frequencyType =>
      text().map(const FrequencyTypeConverter())();

  /// 曜日指定時の対象曜日（1=月〜7=日）。
  TextColumn get weeklyDays => text().map(const WeeklyDaysConverter())();
}
