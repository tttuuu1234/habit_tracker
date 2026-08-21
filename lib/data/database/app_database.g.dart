// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $HabitsTable extends Habits with TableInfo<$HabitsTable, Habit> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $HabitsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    additionalChecks: GeneratedColumn.checkTextLength(
      minTextLength: 1,
      maxTextLength: 30,
    ),
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _createdDateMeta = const VerificationMeta(
    'createdDate',
  );
  @override
  late final GeneratedColumn<DateTime> createdDate = GeneratedColumn<DateTime>(
    'created_date',
    aliasedName,
    false,
    type: DriftSqlType.dateTime,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _colorValueMeta = const VerificationMeta(
    'colorValue',
  );
  @override
  late final GeneratedColumn<int> colorValue = GeneratedColumn<int>(
    'color_value',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  late final GeneratedColumnWithTypeConverter<FrequencyType, String>
  frequencyType = GeneratedColumn<String>(
    'frequency_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  ).withConverter<FrequencyType>($HabitsTable.$converterfrequencyType);
  @override
  late final GeneratedColumnWithTypeConverter<Set<int>, String> weeklyDays =
      GeneratedColumn<String>(
        'weekly_days',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: true,
      ).withConverter<Set<int>>($HabitsTable.$converterweeklyDays);
  @override
  late final GeneratedColumnWithTypeConverter<HabitType, String> habitType =
      GeneratedColumn<String>(
        'habit_type',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant('check'),
      ).withConverter<HabitType>($HabitsTable.$converterhabitType);
  static const VerificationMeta _targetTimeMeta = const VerificationMeta(
    'targetTime',
  );
  @override
  late final GeneratedColumn<int> targetTime = GeneratedColumn<int>(
    'target_time',
    aliasedName,
    true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    createdDate,
    colorValue,
    frequencyType,
    weeklyDays,
    habitType,
    targetTime,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'habits';
  @override
  VerificationContext validateIntegrity(
    Insertable<Habit> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('created_date')) {
      context.handle(
        _createdDateMeta,
        createdDate.isAcceptableOrUnknown(
          data['created_date']!,
          _createdDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_createdDateMeta);
    }
    if (data.containsKey('color_value')) {
      context.handle(
        _colorValueMeta,
        colorValue.isAcceptableOrUnknown(data['color_value']!, _colorValueMeta),
      );
    }
    if (data.containsKey('target_time')) {
      context.handle(
        _targetTimeMeta,
        targetTime.isAcceptableOrUnknown(data['target_time']!, _targetTimeMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Habit map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Habit(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      createdDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}created_date'],
      )!,
      colorValue: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}color_value'],
      ),
      frequencyType: $HabitsTable.$converterfrequencyType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}frequency_type'],
        )!,
      ),
      weeklyDays: $HabitsTable.$converterweeklyDays.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}weekly_days'],
        )!,
      ),
      habitType: $HabitsTable.$converterhabitType.fromSql(
        attachedDatabase.typeMapping.read(
          DriftSqlType.string,
          data['${effectivePrefix}habit_type'],
        )!,
      ),
      targetTime: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}target_time'],
      ),
    );
  }

  @override
  $HabitsTable createAlias(String alias) {
    return $HabitsTable(attachedDatabase, alias);
  }

  static TypeConverter<FrequencyType, String> $converterfrequencyType =
      const FrequencyTypeConverter();
  static TypeConverter<Set<int>, String> $converterweeklyDays =
      const WeeklyDaysConverter();
  static TypeConverter<HabitType, String> $converterhabitType =
      const HabitTypeConverter();
}

class Habit extends DataClass implements Insertable<Habit> {
  /// 自動採番の主キー。
  final int id;

  /// 習慣名。
  final String name;

  /// 登録日。
  final DateTime createdDate;

  /// テーマカラーの値。
  final int? colorValue;

  /// 頻度種別。
  final FrequencyType frequencyType;

  /// 曜日指定時の対象曜日（1=月〜7=日）。
  final Set<int> weeklyDays;

  /// 習慣の種別。
  final HabitType habitType;

  /// 目標時間（分）。時間方式の場合のみ使用。
  final int? targetTime;
  const Habit({
    required this.id,
    required this.name,
    required this.createdDate,
    this.colorValue,
    required this.frequencyType,
    required this.weeklyDays,
    required this.habitType,
    this.targetTime,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    map['created_date'] = Variable<DateTime>(createdDate);
    if (!nullToAbsent || colorValue != null) {
      map['color_value'] = Variable<int>(colorValue);
    }
    {
      map['frequency_type'] = Variable<String>(
        $HabitsTable.$converterfrequencyType.toSql(frequencyType),
      );
    }
    {
      map['weekly_days'] = Variable<String>(
        $HabitsTable.$converterweeklyDays.toSql(weeklyDays),
      );
    }
    {
      map['habit_type'] = Variable<String>(
        $HabitsTable.$converterhabitType.toSql(habitType),
      );
    }
    if (!nullToAbsent || targetTime != null) {
      map['target_time'] = Variable<int>(targetTime);
    }
    return map;
  }

  HabitsCompanion toCompanion(bool nullToAbsent) {
    return HabitsCompanion(
      id: Value(id),
      name: Value(name),
      createdDate: Value(createdDate),
      colorValue: colorValue == null && nullToAbsent
          ? const Value.absent()
          : Value(colorValue),
      frequencyType: Value(frequencyType),
      weeklyDays: Value(weeklyDays),
      habitType: Value(habitType),
      targetTime: targetTime == null && nullToAbsent
          ? const Value.absent()
          : Value(targetTime),
    );
  }

  factory Habit.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Habit(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      createdDate: serializer.fromJson<DateTime>(json['createdDate']),
      colorValue: serializer.fromJson<int?>(json['colorValue']),
      frequencyType: serializer.fromJson<FrequencyType>(json['frequencyType']),
      weeklyDays: serializer.fromJson<Set<int>>(json['weeklyDays']),
      habitType: serializer.fromJson<HabitType>(json['habitType']),
      targetTime: serializer.fromJson<int?>(json['targetTime']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'createdDate': serializer.toJson<DateTime>(createdDate),
      'colorValue': serializer.toJson<int?>(colorValue),
      'frequencyType': serializer.toJson<FrequencyType>(frequencyType),
      'weeklyDays': serializer.toJson<Set<int>>(weeklyDays),
      'habitType': serializer.toJson<HabitType>(habitType),
      'targetTime': serializer.toJson<int?>(targetTime),
    };
  }

  Habit copyWith({
    int? id,
    String? name,
    DateTime? createdDate,
    Value<int?> colorValue = const Value.absent(),
    FrequencyType? frequencyType,
    Set<int>? weeklyDays,
    HabitType? habitType,
    Value<int?> targetTime = const Value.absent(),
  }) => Habit(
    id: id ?? this.id,
    name: name ?? this.name,
    createdDate: createdDate ?? this.createdDate,
    colorValue: colorValue.present ? colorValue.value : this.colorValue,
    frequencyType: frequencyType ?? this.frequencyType,
    weeklyDays: weeklyDays ?? this.weeklyDays,
    habitType: habitType ?? this.habitType,
    targetTime: targetTime.present ? targetTime.value : this.targetTime,
  );
  Habit copyWithCompanion(HabitsCompanion data) {
    return Habit(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      createdDate: data.createdDate.present
          ? data.createdDate.value
          : this.createdDate,
      colorValue: data.colorValue.present
          ? data.colorValue.value
          : this.colorValue,
      frequencyType: data.frequencyType.present
          ? data.frequencyType.value
          : this.frequencyType,
      weeklyDays: data.weeklyDays.present
          ? data.weeklyDays.value
          : this.weeklyDays,
      habitType: data.habitType.present ? data.habitType.value : this.habitType,
      targetTime: data.targetTime.present
          ? data.targetTime.value
          : this.targetTime,
    );
  }

  @override
  String toString() {
    return (StringBuffer('Habit(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdDate: $createdDate, ')
          ..write('colorValue: $colorValue, ')
          ..write('frequencyType: $frequencyType, ')
          ..write('weeklyDays: $weeklyDays, ')
          ..write('habitType: $habitType, ')
          ..write('targetTime: $targetTime')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    createdDate,
    colorValue,
    frequencyType,
    weeklyDays,
    habitType,
    targetTime,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Habit &&
          other.id == this.id &&
          other.name == this.name &&
          other.createdDate == this.createdDate &&
          other.colorValue == this.colorValue &&
          other.frequencyType == this.frequencyType &&
          other.weeklyDays == this.weeklyDays &&
          other.habitType == this.habitType &&
          other.targetTime == this.targetTime);
}

class HabitsCompanion extends UpdateCompanion<Habit> {
  final Value<int> id;
  final Value<String> name;
  final Value<DateTime> createdDate;
  final Value<int?> colorValue;
  final Value<FrequencyType> frequencyType;
  final Value<Set<int>> weeklyDays;
  final Value<HabitType> habitType;
  final Value<int?> targetTime;
  const HabitsCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.createdDate = const Value.absent(),
    this.colorValue = const Value.absent(),
    this.frequencyType = const Value.absent(),
    this.weeklyDays = const Value.absent(),
    this.habitType = const Value.absent(),
    this.targetTime = const Value.absent(),
  });
  HabitsCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    required DateTime createdDate,
    this.colorValue = const Value.absent(),
    required FrequencyType frequencyType,
    required Set<int> weeklyDays,
    this.habitType = const Value.absent(),
    this.targetTime = const Value.absent(),
  }) : name = Value(name),
       createdDate = Value(createdDate),
       frequencyType = Value(frequencyType),
       weeklyDays = Value(weeklyDays);
  static Insertable<Habit> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<DateTime>? createdDate,
    Expression<int>? colorValue,
    Expression<String>? frequencyType,
    Expression<String>? weeklyDays,
    Expression<String>? habitType,
    Expression<int>? targetTime,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (createdDate != null) 'created_date': createdDate,
      if (colorValue != null) 'color_value': colorValue,
      if (frequencyType != null) 'frequency_type': frequencyType,
      if (weeklyDays != null) 'weekly_days': weeklyDays,
      if (habitType != null) 'habit_type': habitType,
      if (targetTime != null) 'target_time': targetTime,
    });
  }

  HabitsCompanion copyWith({
    Value<int>? id,
    Value<String>? name,
    Value<DateTime>? createdDate,
    Value<int?>? colorValue,
    Value<FrequencyType>? frequencyType,
    Value<Set<int>>? weeklyDays,
    Value<HabitType>? habitType,
    Value<int?>? targetTime,
  }) {
    return HabitsCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      createdDate: createdDate ?? this.createdDate,
      colorValue: colorValue ?? this.colorValue,
      frequencyType: frequencyType ?? this.frequencyType,
      weeklyDays: weeklyDays ?? this.weeklyDays,
      habitType: habitType ?? this.habitType,
      targetTime: targetTime ?? this.targetTime,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (createdDate.present) {
      map['created_date'] = Variable<DateTime>(createdDate.value);
    }
    if (colorValue.present) {
      map['color_value'] = Variable<int>(colorValue.value);
    }
    if (frequencyType.present) {
      map['frequency_type'] = Variable<String>(
        $HabitsTable.$converterfrequencyType.toSql(frequencyType.value),
      );
    }
    if (weeklyDays.present) {
      map['weekly_days'] = Variable<String>(
        $HabitsTable.$converterweeklyDays.toSql(weeklyDays.value),
      );
    }
    if (habitType.present) {
      map['habit_type'] = Variable<String>(
        $HabitsTable.$converterhabitType.toSql(habitType.value),
      );
    }
    if (targetTime.present) {
      map['target_time'] = Variable<int>(targetTime.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('HabitsCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('createdDate: $createdDate, ')
          ..write('colorValue: $colorValue, ')
          ..write('frequencyType: $frequencyType, ')
          ..write('weeklyDays: $weeklyDays, ')
          ..write('habitType: $habitType, ')
          ..write('targetTime: $targetTime')
          ..write(')'))
        .toString();
  }
}

class $CompletionRecordsTable extends CompletionRecords
    with TableInfo<$CompletionRecordsTable, CompletionRecord> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CompletionRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
    'id',
    aliasedName,
    false,
    hasAutoIncrement: true,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'PRIMARY KEY AUTOINCREMENT',
    ),
  );
  static const VerificationMeta _habitIdMeta = const VerificationMeta(
    'habitId',
  );
  @override
  late final GeneratedColumn<int> habitId = GeneratedColumn<int>(
    'habit_id',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES habits (id) ON DELETE CASCADE',
    ),
  );
  static const VerificationMeta _completedDateMeta = const VerificationMeta(
    'completedDate',
  );
  @override
  late final GeneratedColumn<DateTime> completedDate =
      GeneratedColumn<DateTime>(
        'completed_date',
        aliasedName,
        false,
        type: DriftSqlType.dateTime,
        requiredDuringInsert: true,
      );
  @override
  List<GeneratedColumn> get $columns => [id, habitId, completedDate];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'completion_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<CompletionRecord> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('habit_id')) {
      context.handle(
        _habitIdMeta,
        habitId.isAcceptableOrUnknown(data['habit_id']!, _habitIdMeta),
      );
    } else if (isInserting) {
      context.missing(_habitIdMeta);
    }
    if (data.containsKey('completed_date')) {
      context.handle(
        _completedDateMeta,
        completedDate.isAcceptableOrUnknown(
          data['completed_date']!,
          _completedDateMeta,
        ),
      );
    } else if (isInserting) {
      context.missing(_completedDateMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  List<Set<GeneratedColumn>> get uniqueKeys => [
    {habitId, completedDate},
  ];
  @override
  CompletionRecord map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CompletionRecord(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}id'],
      )!,
      habitId: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}habit_id'],
      )!,
      completedDate: attachedDatabase.typeMapping.read(
        DriftSqlType.dateTime,
        data['${effectivePrefix}completed_date'],
      )!,
    );
  }

  @override
  $CompletionRecordsTable createAlias(String alias) {
    return $CompletionRecordsTable(attachedDatabase, alias);
  }
}

class CompletionRecord extends DataClass
    implements Insertable<CompletionRecord> {
  /// 自動採番の主キー。
  final int id;

  /// 対象の習慣ID。
  final int habitId;

  /// 達成した日付。
  final DateTime completedDate;
  const CompletionRecord({
    required this.id,
    required this.habitId,
    required this.completedDate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['habit_id'] = Variable<int>(habitId);
    map['completed_date'] = Variable<DateTime>(completedDate);
    return map;
  }

  CompletionRecordsCompanion toCompanion(bool nullToAbsent) {
    return CompletionRecordsCompanion(
      id: Value(id),
      habitId: Value(habitId),
      completedDate: Value(completedDate),
    );
  }

  factory CompletionRecord.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CompletionRecord(
      id: serializer.fromJson<int>(json['id']),
      habitId: serializer.fromJson<int>(json['habitId']),
      completedDate: serializer.fromJson<DateTime>(json['completedDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'habitId': serializer.toJson<int>(habitId),
      'completedDate': serializer.toJson<DateTime>(completedDate),
    };
  }

  CompletionRecord copyWith({int? id, int? habitId, DateTime? completedDate}) =>
      CompletionRecord(
        id: id ?? this.id,
        habitId: habitId ?? this.habitId,
        completedDate: completedDate ?? this.completedDate,
      );
  CompletionRecord copyWithCompanion(CompletionRecordsCompanion data) {
    return CompletionRecord(
      id: data.id.present ? data.id.value : this.id,
      habitId: data.habitId.present ? data.habitId.value : this.habitId,
      completedDate: data.completedDate.present
          ? data.completedDate.value
          : this.completedDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CompletionRecord(')
          ..write('id: $id, ')
          ..write('habitId: $habitId, ')
          ..write('completedDate: $completedDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, habitId, completedDate);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CompletionRecord &&
          other.id == this.id &&
          other.habitId == this.habitId &&
          other.completedDate == this.completedDate);
}

class CompletionRecordsCompanion extends UpdateCompanion<CompletionRecord> {
  final Value<int> id;
  final Value<int> habitId;
  final Value<DateTime> completedDate;
  const CompletionRecordsCompanion({
    this.id = const Value.absent(),
    this.habitId = const Value.absent(),
    this.completedDate = const Value.absent(),
  });
  CompletionRecordsCompanion.insert({
    this.id = const Value.absent(),
    required int habitId,
    required DateTime completedDate,
  }) : habitId = Value(habitId),
       completedDate = Value(completedDate);
  static Insertable<CompletionRecord> custom({
    Expression<int>? id,
    Expression<int>? habitId,
    Expression<DateTime>? completedDate,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (habitId != null) 'habit_id': habitId,
      if (completedDate != null) 'completed_date': completedDate,
    });
  }

  CompletionRecordsCompanion copyWith({
    Value<int>? id,
    Value<int>? habitId,
    Value<DateTime>? completedDate,
  }) {
    return CompletionRecordsCompanion(
      id: id ?? this.id,
      habitId: habitId ?? this.habitId,
      completedDate: completedDate ?? this.completedDate,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (habitId.present) {
      map['habit_id'] = Variable<int>(habitId.value);
    }
    if (completedDate.present) {
      map['completed_date'] = Variable<DateTime>(completedDate.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CompletionRecordsCompanion(')
          ..write('id: $id, ')
          ..write('habitId: $habitId, ')
          ..write('completedDate: $completedDate')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $HabitsTable habits = $HabitsTable(this);
  late final $CompletionRecordsTable completionRecords =
      $CompletionRecordsTable(this);
  late final HabitDao habitDao = HabitDao(this as AppDatabase);
  late final CompletionRecordDao completionRecordDao = CompletionRecordDao(
    this as AppDatabase,
  );
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    habits,
    completionRecords,
  ];
  @override
  StreamQueryUpdateRules get streamUpdateRules => const StreamQueryUpdateRules([
    WritePropagation(
      on: TableUpdateQuery.onTableName(
        'habits',
        limitUpdateKind: UpdateKind.delete,
      ),
      result: [TableUpdate('completion_records', kind: UpdateKind.delete)],
    ),
  ]);
}

typedef $$HabitsTableCreateCompanionBuilder =
    HabitsCompanion Function({
      Value<int> id,
      required String name,
      required DateTime createdDate,
      Value<int?> colorValue,
      required FrequencyType frequencyType,
      required Set<int> weeklyDays,
      Value<HabitType> habitType,
      Value<int?> targetTime,
    });
typedef $$HabitsTableUpdateCompanionBuilder =
    HabitsCompanion Function({
      Value<int> id,
      Value<String> name,
      Value<DateTime> createdDate,
      Value<int?> colorValue,
      Value<FrequencyType> frequencyType,
      Value<Set<int>> weeklyDays,
      Value<HabitType> habitType,
      Value<int?> targetTime,
    });

final class $$HabitsTableReferences
    extends BaseReferences<_$AppDatabase, $HabitsTable, Habit> {
  $$HabitsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$CompletionRecordsTable, List<CompletionRecord>>
  _completionRecordsRefsTable(_$AppDatabase db) =>
      MultiTypedResultKey.fromTable(
        db.completionRecords,
        aliasName: $_aliasNameGenerator(
          db.habits.id,
          db.completionRecords.habitId,
        ),
      );

  $$CompletionRecordsTableProcessedTableManager get completionRecordsRefs {
    final manager = $$CompletionRecordsTableTableManager(
      $_db,
      $_db.completionRecords,
    ).filter((f) => f.habitId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(
      _completionRecordsRefsTable($_db),
    );
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$HabitsTableFilterComposer
    extends Composer<_$AppDatabase, $HabitsTable> {
  $$HabitsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get createdDate => $composableBuilder(
    column: $table.createdDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get colorValue => $composableBuilder(
    column: $table.colorValue,
    builder: (column) => ColumnFilters(column),
  );

  ColumnWithTypeConverterFilters<FrequencyType, FrequencyType, String>
  get frequencyType => $composableBuilder(
    column: $table.frequencyType,
    builder: (column) => ColumnWithTypeConverterFilters(column),
  );

  ColumnWithTypeConverterFilters<Set<int>, Set<int>, String> get weeklyDays =>
      $composableBuilder(
        column: $table.weeklyDays,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnWithTypeConverterFilters<HabitType, HabitType, String> get habitType =>
      $composableBuilder(
        column: $table.habitType,
        builder: (column) => ColumnWithTypeConverterFilters(column),
      );

  ColumnFilters<int> get targetTime => $composableBuilder(
    column: $table.targetTime,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> completionRecordsRefs(
    Expression<bool> Function($$CompletionRecordsTableFilterComposer f) f,
  ) {
    final $$CompletionRecordsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.completionRecords,
      getReferencedColumn: (t) => t.habitId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$CompletionRecordsTableFilterComposer(
            $db: $db,
            $table: $db.completionRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$HabitsTableOrderingComposer
    extends Composer<_$AppDatabase, $HabitsTable> {
  $$HabitsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get createdDate => $composableBuilder(
    column: $table.createdDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get colorValue => $composableBuilder(
    column: $table.colorValue,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get frequencyType => $composableBuilder(
    column: $table.frequencyType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get weeklyDays => $composableBuilder(
    column: $table.weeklyDays,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get habitType => $composableBuilder(
    column: $table.habitType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get targetTime => $composableBuilder(
    column: $table.targetTime,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$HabitsTableAnnotationComposer
    extends Composer<_$AppDatabase, $HabitsTable> {
  $$HabitsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<DateTime> get createdDate => $composableBuilder(
    column: $table.createdDate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get colorValue => $composableBuilder(
    column: $table.colorValue,
    builder: (column) => column,
  );

  GeneratedColumnWithTypeConverter<FrequencyType, String> get frequencyType =>
      $composableBuilder(
        column: $table.frequencyType,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<Set<int>, String> get weeklyDays =>
      $composableBuilder(
        column: $table.weeklyDays,
        builder: (column) => column,
      );

  GeneratedColumnWithTypeConverter<HabitType, String> get habitType =>
      $composableBuilder(column: $table.habitType, builder: (column) => column);

  GeneratedColumn<int> get targetTime => $composableBuilder(
    column: $table.targetTime,
    builder: (column) => column,
  );

  Expression<T> completionRecordsRefs<T extends Object>(
    Expression<T> Function($$CompletionRecordsTableAnnotationComposer a) f,
  ) {
    final $$CompletionRecordsTableAnnotationComposer composer =
        $composerBuilder(
          composer: this,
          getCurrentColumn: (t) => t.id,
          referencedTable: $db.completionRecords,
          getReferencedColumn: (t) => t.habitId,
          builder:
              (
                joinBuilder, {
                $addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer,
              }) => $$CompletionRecordsTableAnnotationComposer(
                $db: $db,
                $table: $db.completionRecords,
                $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                joinBuilder: joinBuilder,
                $removeJoinBuilderFromRootComposer:
                    $removeJoinBuilderFromRootComposer,
              ),
        );
    return f(composer);
  }
}

class $$HabitsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $HabitsTable,
          Habit,
          $$HabitsTableFilterComposer,
          $$HabitsTableOrderingComposer,
          $$HabitsTableAnnotationComposer,
          $$HabitsTableCreateCompanionBuilder,
          $$HabitsTableUpdateCompanionBuilder,
          (Habit, $$HabitsTableReferences),
          Habit,
          PrefetchHooks Function({bool completionRecordsRefs})
        > {
  $$HabitsTableTableManager(_$AppDatabase db, $HabitsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$HabitsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$HabitsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$HabitsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<DateTime> createdDate = const Value.absent(),
                Value<int?> colorValue = const Value.absent(),
                Value<FrequencyType> frequencyType = const Value.absent(),
                Value<Set<int>> weeklyDays = const Value.absent(),
                Value<HabitType> habitType = const Value.absent(),
                Value<int?> targetTime = const Value.absent(),
              }) => HabitsCompanion(
                id: id,
                name: name,
                createdDate: createdDate,
                colorValue: colorValue,
                frequencyType: frequencyType,
                weeklyDays: weeklyDays,
                habitType: habitType,
                targetTime: targetTime,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required String name,
                required DateTime createdDate,
                Value<int?> colorValue = const Value.absent(),
                required FrequencyType frequencyType,
                required Set<int> weeklyDays,
                Value<HabitType> habitType = const Value.absent(),
                Value<int?> targetTime = const Value.absent(),
              }) => HabitsCompanion.insert(
                id: id,
                name: name,
                createdDate: createdDate,
                colorValue: colorValue,
                frequencyType: frequencyType,
                weeklyDays: weeklyDays,
                habitType: habitType,
                targetTime: targetTime,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) =>
                    (e.readTable(table), $$HabitsTableReferences(db, table, e)),
              )
              .toList(),
          prefetchHooksCallback: ({completionRecordsRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (completionRecordsRefs) db.completionRecords,
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (completionRecordsRefs)
                    await $_getPrefetchedData<
                      Habit,
                      $HabitsTable,
                      CompletionRecord
                    >(
                      currentTable: table,
                      referencedTable: $$HabitsTableReferences
                          ._completionRecordsRefsTable(db),
                      managerFromTypedResult: (p0) => $$HabitsTableReferences(
                        db,
                        table,
                        p0,
                      ).completionRecordsRefs,
                      referencedItemsForCurrentItem: (item, referencedItems) =>
                          referencedItems.where((e) => e.habitId == item.id),
                      typedResults: items,
                    ),
                ];
              },
            );
          },
        ),
      );
}

typedef $$HabitsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $HabitsTable,
      Habit,
      $$HabitsTableFilterComposer,
      $$HabitsTableOrderingComposer,
      $$HabitsTableAnnotationComposer,
      $$HabitsTableCreateCompanionBuilder,
      $$HabitsTableUpdateCompanionBuilder,
      (Habit, $$HabitsTableReferences),
      Habit,
      PrefetchHooks Function({bool completionRecordsRefs})
    >;
typedef $$CompletionRecordsTableCreateCompanionBuilder =
    CompletionRecordsCompanion Function({
      Value<int> id,
      required int habitId,
      required DateTime completedDate,
    });
typedef $$CompletionRecordsTableUpdateCompanionBuilder =
    CompletionRecordsCompanion Function({
      Value<int> id,
      Value<int> habitId,
      Value<DateTime> completedDate,
    });

final class $$CompletionRecordsTableReferences
    extends
        BaseReferences<
          _$AppDatabase,
          $CompletionRecordsTable,
          CompletionRecord
        > {
  $$CompletionRecordsTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $HabitsTable _habitIdTable(_$AppDatabase db) => db.habits.createAlias(
    $_aliasNameGenerator(db.completionRecords.habitId, db.habits.id),
  );

  $$HabitsTableProcessedTableManager get habitId {
    final $_column = $_itemColumn<int>('habit_id')!;

    final manager = $$HabitsTableTableManager(
      $_db,
      $_db.habits,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_habitIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$CompletionRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $CompletionRecordsTable> {
  $$CompletionRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<DateTime> get completedDate => $composableBuilder(
    column: $table.completedDate,
    builder: (column) => ColumnFilters(column),
  );

  $$HabitsTableFilterComposer get habitId {
    final $$HabitsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.habitId,
      referencedTable: $db.habits,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitsTableFilterComposer(
            $db: $db,
            $table: $db.habits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CompletionRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $CompletionRecordsTable> {
  $$CompletionRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<DateTime> get completedDate => $composableBuilder(
    column: $table.completedDate,
    builder: (column) => ColumnOrderings(column),
  );

  $$HabitsTableOrderingComposer get habitId {
    final $$HabitsTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.habitId,
      referencedTable: $db.habits,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitsTableOrderingComposer(
            $db: $db,
            $table: $db.habits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CompletionRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $CompletionRecordsTable> {
  $$CompletionRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<DateTime> get completedDate => $composableBuilder(
    column: $table.completedDate,
    builder: (column) => column,
  );

  $$HabitsTableAnnotationComposer get habitId {
    final $$HabitsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.habitId,
      referencedTable: $db.habits,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$HabitsTableAnnotationComposer(
            $db: $db,
            $table: $db.habits,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$CompletionRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $CompletionRecordsTable,
          CompletionRecord,
          $$CompletionRecordsTableFilterComposer,
          $$CompletionRecordsTableOrderingComposer,
          $$CompletionRecordsTableAnnotationComposer,
          $$CompletionRecordsTableCreateCompanionBuilder,
          $$CompletionRecordsTableUpdateCompanionBuilder,
          (CompletionRecord, $$CompletionRecordsTableReferences),
          CompletionRecord,
          PrefetchHooks Function({bool habitId})
        > {
  $$CompletionRecordsTableTableManager(
    _$AppDatabase db,
    $CompletionRecordsTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CompletionRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CompletionRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CompletionRecordsTableAnnotationComposer(
                $db: db,
                $table: table,
              ),
          updateCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                Value<int> habitId = const Value.absent(),
                Value<DateTime> completedDate = const Value.absent(),
              }) => CompletionRecordsCompanion(
                id: id,
                habitId: habitId,
                completedDate: completedDate,
              ),
          createCompanionCallback:
              ({
                Value<int> id = const Value.absent(),
                required int habitId,
                required DateTime completedDate,
              }) => CompletionRecordsCompanion.insert(
                id: id,
                habitId: habitId,
                completedDate: completedDate,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$CompletionRecordsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({habitId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (habitId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.habitId,
                                referencedTable:
                                    $$CompletionRecordsTableReferences
                                        ._habitIdTable(db),
                                referencedColumn:
                                    $$CompletionRecordsTableReferences
                                        ._habitIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$CompletionRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $CompletionRecordsTable,
      CompletionRecord,
      $$CompletionRecordsTableFilterComposer,
      $$CompletionRecordsTableOrderingComposer,
      $$CompletionRecordsTableAnnotationComposer,
      $$CompletionRecordsTableCreateCompanionBuilder,
      $$CompletionRecordsTableUpdateCompanionBuilder,
      (CompletionRecord, $$CompletionRecordsTableReferences),
      CompletionRecord,
      PrefetchHooks Function({bool habitId})
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$HabitsTableTableManager get habits =>
      $$HabitsTableTableManager(_db, _db.habits);
  $$CompletionRecordsTableTableManager get completionRecords =>
      $$CompletionRecordsTableTableManager(_db, _db.completionRecords);
}
