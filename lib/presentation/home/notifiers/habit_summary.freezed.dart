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
 bool get isCompleted;/// テーマカラーの値。
 int? get colorValue;
/// Create a copy of HabitSummary
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HabitSummaryCopyWith<HabitSummary> get copyWith => _$HabitSummaryCopyWithImpl<HabitSummary>(this as HabitSummary, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HabitSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.streakDays, streakDays) || other.streakDays == streakDays)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.colorValue, colorValue) || other.colorValue == colorValue));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,streakDays,isCompleted,colorValue);

@override
String toString() {
  return 'HabitSummary(id: $id, name: $name, streakDays: $streakDays, isCompleted: $isCompleted, colorValue: $colorValue)';
}


}

/// @nodoc
abstract mixin class $HabitSummaryCopyWith<$Res>  {
  factory $HabitSummaryCopyWith(HabitSummary value, $Res Function(HabitSummary) _then) = _$HabitSummaryCopyWithImpl;
@useResult
$Res call({
 int id, String name, int streakDays, bool isCompleted, int? colorValue
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
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? streakDays = null,Object? isCompleted = null,Object? colorValue = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,streakDays: null == streakDays ? _self.streakDays : streakDays // ignore: cast_nullable_to_non_nullable
as int,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,colorValue: freezed == colorValue ? _self.colorValue : colorValue // ignore: cast_nullable_to_non_nullable
as int?,
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HabitSummary value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HabitSummary() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HabitSummary value)  $default,){
final _that = this;
switch (_that) {
case _HabitSummary():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HabitSummary value)?  $default,){
final _that = this;
switch (_that) {
case _HabitSummary() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  int streakDays,  bool isCompleted,  int? colorValue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HabitSummary() when $default != null:
return $default(_that.id,_that.name,_that.streakDays,_that.isCompleted,_that.colorValue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  int streakDays,  bool isCompleted,  int? colorValue)  $default,) {final _that = this;
switch (_that) {
case _HabitSummary():
return $default(_that.id,_that.name,_that.streakDays,_that.isCompleted,_that.colorValue);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  int streakDays,  bool isCompleted,  int? colorValue)?  $default,) {final _that = this;
switch (_that) {
case _HabitSummary() when $default != null:
return $default(_that.id,_that.name,_that.streakDays,_that.isCompleted,_that.colorValue);case _:
  return null;

}
}

}

/// @nodoc


class _HabitSummary implements HabitSummary {
  const _HabitSummary({required this.id, required this.name, required this.streakDays, required this.isCompleted, required this.colorValue});
  

/// 習慣ID。
@override final  int id;
/// 習慣名。
@override final  String name;
/// 現在の連続達成日数。
@override final  int streakDays;
/// 今日達成済みかどうか。
@override final  bool isCompleted;
/// テーマカラーの値。
@override final  int? colorValue;

/// Create a copy of HabitSummary
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HabitSummaryCopyWith<_HabitSummary> get copyWith => __$HabitSummaryCopyWithImpl<_HabitSummary>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HabitSummary&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.streakDays, streakDays) || other.streakDays == streakDays)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.colorValue, colorValue) || other.colorValue == colorValue));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,streakDays,isCompleted,colorValue);

@override
String toString() {
  return 'HabitSummary(id: $id, name: $name, streakDays: $streakDays, isCompleted: $isCompleted, colorValue: $colorValue)';
}


}

/// @nodoc
abstract mixin class _$HabitSummaryCopyWith<$Res> implements $HabitSummaryCopyWith<$Res> {
  factory _$HabitSummaryCopyWith(_HabitSummary value, $Res Function(_HabitSummary) _then) = __$HabitSummaryCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, int streakDays, bool isCompleted, int? colorValue
});




}
/// @nodoc
class __$HabitSummaryCopyWithImpl<$Res>
    implements _$HabitSummaryCopyWith<$Res> {
  __$HabitSummaryCopyWithImpl(this._self, this._then);

  final _HabitSummary _self;
  final $Res Function(_HabitSummary) _then;

/// Create a copy of HabitSummary
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? streakDays = null,Object? isCompleted = null,Object? colorValue = freezed,}) {
  return _then(_HabitSummary(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,streakDays: null == streakDays ? _self.streakDays : streakDays // ignore: cast_nullable_to_non_nullable
as int,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,colorValue: freezed == colorValue ? _self.colorValue : colorValue // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
