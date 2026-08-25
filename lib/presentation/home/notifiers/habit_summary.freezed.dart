// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit_summary.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HabitSummary {

/// 習慣ID。
 int get id;/// 習慣名。
 String get name;/// 現在の連続達成日数。
 int get streakDays;/// 今日達成済みかどうか。
 bool get isCompleted;/// カテゴリ。
 HabitCategory? get category;
/// Create a copy of HabitSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HabitSummaryCopyWith<HabitSummary> get copyWith => _$HabitSummaryCopyWithImpl<HabitSummary>(this as HabitSummary, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HabitSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.streakDays, streakDays) || other.streakDays == streakDays)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,streakDays,isCompleted,category);

@override
String toString() {
  return 'HabitSummary(id: $id, name: $name, streakDays: $streakDays, isCompleted: $isCompleted, category: $category)';
}


}

/// @nodoc
abstract mixin class $HabitSummaryCopyWith<$Res>  {
  factory $HabitSummaryCopyWith(HabitSummary value, $Res Function(HabitSummary) _then) = _$HabitSummaryCopyWithImpl;
@useResult
$Res call({
 int id, String name, int streakDays, bool isCompleted, HabitCategory? category
});




}
/// @nodoc
class _$HabitSummaryCopyWithImpl<$Res>
    implements $HabitSummaryCopyWith<$Res> {
  _$HabitSummaryCopyWithImpl(this._self, this._then);

  final HabitSummary _self;
  final $Res Function(HabitSummary) _then;

/// Create a copy of HabitSummary
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? streakDays = null,Object? isCompleted = null,Object? category = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,streakDays: null == streakDays ? _self.streakDays : streakDays // ignore: cast_nullable_to_non_nullable
as int,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as HabitCategory?,
  ));
}

}


/// Adds pattern-matching-related methods to [HabitSummary].
extension HabitSummaryPatterns on HabitSummary {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CheckHabitSummary value)?  check,TResult Function( TimeHabitSummary value)?  time,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CheckHabitSummary() when check != null:
return check(_that);case TimeHabitSummary() when time != null:
return time(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CheckHabitSummary value)  check,required TResult Function( TimeHabitSummary value)  time,}){
final _that = this;
switch (_that) {
case CheckHabitSummary():
return check(_that);case TimeHabitSummary():
return time(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CheckHabitSummary value)?  check,TResult? Function( TimeHabitSummary value)?  time,}){
final _that = this;
switch (_that) {
case CheckHabitSummary() when check != null:
return check(_that);case TimeHabitSummary() when time != null:
return time(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( int id,  String name,  int streakDays,  bool isCompleted,  HabitCategory? category)?  check,TResult Function( int id,  String name,  int streakDays,  bool isCompleted,  HabitCategory? category,  int targetTime)?  time,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CheckHabitSummary() when check != null:
return check(_that.id,_that.name,_that.streakDays,_that.isCompleted,_that.category);case TimeHabitSummary() when time != null:
return time(_that.id,_that.name,_that.streakDays,_that.isCompleted,_that.category,_that.targetTime);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( int id,  String name,  int streakDays,  bool isCompleted,  HabitCategory? category)  check,required TResult Function( int id,  String name,  int streakDays,  bool isCompleted,  HabitCategory? category,  int targetTime)  time,}) {final _that = this;
switch (_that) {
case CheckHabitSummary():
return check(_that.id,_that.name,_that.streakDays,_that.isCompleted,_that.category);case TimeHabitSummary():
return time(_that.id,_that.name,_that.streakDays,_that.isCompleted,_that.category,_that.targetTime);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( int id,  String name,  int streakDays,  bool isCompleted,  HabitCategory? category)?  check,TResult? Function( int id,  String name,  int streakDays,  bool isCompleted,  HabitCategory? category,  int targetTime)?  time,}) {final _that = this;
switch (_that) {
case CheckHabitSummary() when check != null:
return check(_that.id,_that.name,_that.streakDays,_that.isCompleted,_that.category);case TimeHabitSummary() when time != null:
return time(_that.id,_that.name,_that.streakDays,_that.isCompleted,_that.category,_that.targetTime);case _:
  return null;

}
}

}

/// @nodoc


class CheckHabitSummary implements HabitSummary {
  const CheckHabitSummary({required this.id, required this.name, required this.streakDays, required this.isCompleted, required this.category});
  

/// 習慣ID。
@override final  int id;
/// 習慣名。
@override final  String name;
/// 現在の連続達成日数。
@override final  int streakDays;
/// 今日達成済みかどうか。
@override final  bool isCompleted;
/// カテゴリ。
@override final  HabitCategory? category;

/// Create a copy of HabitSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckHabitSummaryCopyWith<CheckHabitSummary> get copyWith => _$CheckHabitSummaryCopyWithImpl<CheckHabitSummary>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckHabitSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.streakDays, streakDays) || other.streakDays == streakDays)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.category, category) || other.category == category));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,streakDays,isCompleted,category);

@override
String toString() {
  return 'HabitSummary.check(id: $id, name: $name, streakDays: $streakDays, isCompleted: $isCompleted, category: $category)';
}


}

/// @nodoc
abstract mixin class $CheckHabitSummaryCopyWith<$Res> implements $HabitSummaryCopyWith<$Res> {
  factory $CheckHabitSummaryCopyWith(CheckHabitSummary value, $Res Function(CheckHabitSummary) _then) = _$CheckHabitSummaryCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, int streakDays, bool isCompleted, HabitCategory? category
});




}
/// @nodoc
class _$CheckHabitSummaryCopyWithImpl<$Res>
    implements $CheckHabitSummaryCopyWith<$Res> {
  _$CheckHabitSummaryCopyWithImpl(this._self, this._then);

  final CheckHabitSummary _self;
  final $Res Function(CheckHabitSummary) _then;

/// Create a copy of HabitSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? streakDays = null,Object? isCompleted = null,Object? category = freezed,}) {
  return _then(CheckHabitSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,streakDays: null == streakDays ? _self.streakDays : streakDays // ignore: cast_nullable_to_non_nullable
as int,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as HabitCategory?,
  ));
}


}

/// @nodoc


class TimeHabitSummary implements HabitSummary {
  const TimeHabitSummary({required this.id, required this.name, required this.streakDays, required this.isCompleted, required this.category, required this.targetTime});
  

/// 習慣ID。
@override final  int id;
/// 習慣名。
@override final  String name;
/// 現在の連続達成日数。
@override final  int streakDays;
/// 今日達成済みかどうか。
@override final  bool isCompleted;
/// カテゴリ。
@override final  HabitCategory? category;
/// 目標時間（分）。
 final  int targetTime;

/// Create a copy of HabitSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimeHabitSummaryCopyWith<TimeHabitSummary> get copyWith => _$TimeHabitSummaryCopyWithImpl<TimeHabitSummary>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimeHabitSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.streakDays, streakDays) || other.streakDays == streakDays)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.category, category) || other.category == category)&&(identical(other.targetTime, targetTime) || other.targetTime == targetTime));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,streakDays,isCompleted,category,targetTime);

@override
String toString() {
  return 'HabitSummary.time(id: $id, name: $name, streakDays: $streakDays, isCompleted: $isCompleted, category: $category, targetTime: $targetTime)';
}


}

/// @nodoc
abstract mixin class $TimeHabitSummaryCopyWith<$Res> implements $HabitSummaryCopyWith<$Res> {
  factory $TimeHabitSummaryCopyWith(TimeHabitSummary value, $Res Function(TimeHabitSummary) _then) = _$TimeHabitSummaryCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, int streakDays, bool isCompleted, HabitCategory? category, int targetTime
});




}
/// @nodoc
class _$TimeHabitSummaryCopyWithImpl<$Res>
    implements $TimeHabitSummaryCopyWith<$Res> {
  _$TimeHabitSummaryCopyWithImpl(this._self, this._then);

  final TimeHabitSummary _self;
  final $Res Function(TimeHabitSummary) _then;

/// Create a copy of HabitSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? streakDays = null,Object? isCompleted = null,Object? category = freezed,Object? targetTime = null,}) {
  return _then(TimeHabitSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,streakDays: null == streakDays ? _self.streakDays : streakDays // ignore: cast_nullable_to_non_nullable
as int,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as HabitCategory?,targetTime: null == targetTime ? _self.targetTime : targetTime // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
