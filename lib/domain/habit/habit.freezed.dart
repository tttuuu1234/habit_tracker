// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$Habit {

/// 一意なID。
 int get id;/// 習慣名。
 String get name;/// 登録日。
 DateTime get createdDate;/// テーマカラーの値（null時はデフォルト色を使用）。
 int? get colorValue;/// 頻度種別。
 FrequencyType get frequencyType;/// 曜日指定時の対象曜日（1=月〜7=日）。
 Set<int> get weeklyDays;
/// Create a copy of Habit
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HabitCopyWith<Habit> get copyWith => _$HabitCopyWithImpl<Habit>(this as Habit, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Habit&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.createdDate, createdDate) || other.createdDate == createdDate)&&(identical(other.colorValue, colorValue) || other.colorValue == colorValue)&&(identical(other.frequencyType, frequencyType) || other.frequencyType == frequencyType)&&const DeepCollectionEquality().equals(other.weeklyDays, weeklyDays));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,createdDate,colorValue,frequencyType,const DeepCollectionEquality().hash(weeklyDays));

@override
String toString() {
  return 'Habit(id: $id, name: $name, createdDate: $createdDate, colorValue: $colorValue, frequencyType: $frequencyType, weeklyDays: $weeklyDays)';
}


}

/// @nodoc
abstract mixin class $HabitCopyWith<$Res>  {
  factory $HabitCopyWith(Habit value, $Res Function(Habit) _then) = _$HabitCopyWithImpl;
@useResult
$Res call({
 int id, String name, DateTime createdDate, int? colorValue, FrequencyType frequencyType, Set<int> weeklyDays
});




}
/// @nodoc
class _$HabitCopyWithImpl<$Res>
    implements $HabitCopyWith<$Res> {
  _$HabitCopyWithImpl(this._self, this._then);

  final Habit _self;
  final $Res Function(Habit) _then;

/// Create a copy of Habit
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? createdDate = null,Object? colorValue = freezed,Object? frequencyType = null,Object? weeklyDays = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,createdDate: null == createdDate ? _self.createdDate : createdDate // ignore: cast_nullable_to_non_nullable
as DateTime,colorValue: freezed == colorValue ? _self.colorValue : colorValue // ignore: cast_nullable_to_non_nullable
as int?,frequencyType: null == frequencyType ? _self.frequencyType : frequencyType // ignore: cast_nullable_to_non_nullable
as FrequencyType,weeklyDays: null == weeklyDays ? _self.weeklyDays : weeklyDays // ignore: cast_nullable_to_non_nullable
as Set<int>,
  ));
}

}


/// Adds pattern-matching-related methods to [Habit].
extension HabitPatterns on Habit {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Habit value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Habit() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Habit value)  $default,){
final _that = this;
switch (_that) {
case _Habit():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Habit value)?  $default,){
final _that = this;
switch (_that) {
case _Habit() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  DateTime createdDate,  int? colorValue,  FrequencyType frequencyType,  Set<int> weeklyDays)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Habit() when $default != null:
return $default(_that.id,_that.name,_that.createdDate,_that.colorValue,_that.frequencyType,_that.weeklyDays);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  DateTime createdDate,  int? colorValue,  FrequencyType frequencyType,  Set<int> weeklyDays)  $default,) {final _that = this;
switch (_that) {
case _Habit():
return $default(_that.id,_that.name,_that.createdDate,_that.colorValue,_that.frequencyType,_that.weeklyDays);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  DateTime createdDate,  int? colorValue,  FrequencyType frequencyType,  Set<int> weeklyDays)?  $default,) {final _that = this;
switch (_that) {
case _Habit() when $default != null:
return $default(_that.id,_that.name,_that.createdDate,_that.colorValue,_that.frequencyType,_that.weeklyDays);case _:
  return null;

}
}

}

/// @nodoc


class _Habit implements Habit {
  const _Habit({required this.id, required this.name, required this.createdDate, required this.colorValue, required this.frequencyType, required final  Set<int> weeklyDays}): _weeklyDays = weeklyDays;
  

/// 一意なID。
@override final  int id;
/// 習慣名。
@override final  String name;
/// 登録日。
@override final  DateTime createdDate;
/// テーマカラーの値（null時はデフォルト色を使用）。
@override final  int? colorValue;
/// 頻度種別。
@override final  FrequencyType frequencyType;
/// 曜日指定時の対象曜日（1=月〜7=日）。
 final  Set<int> _weeklyDays;
/// 曜日指定時の対象曜日（1=月〜7=日）。
@override Set<int> get weeklyDays {
  if (_weeklyDays is EqualUnmodifiableSetView) return _weeklyDays;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_weeklyDays);
}


/// Create a copy of Habit
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HabitCopyWith<_Habit> get copyWith => __$HabitCopyWithImpl<_Habit>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Habit&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.createdDate, createdDate) || other.createdDate == createdDate)&&(identical(other.colorValue, colorValue) || other.colorValue == colorValue)&&(identical(other.frequencyType, frequencyType) || other.frequencyType == frequencyType)&&const DeepCollectionEquality().equals(other._weeklyDays, _weeklyDays));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,createdDate,colorValue,frequencyType,const DeepCollectionEquality().hash(_weeklyDays));

@override
String toString() {
  return 'Habit(id: $id, name: $name, createdDate: $createdDate, colorValue: $colorValue, frequencyType: $frequencyType, weeklyDays: $weeklyDays)';
}


}

/// @nodoc
abstract mixin class _$HabitCopyWith<$Res> implements $HabitCopyWith<$Res> {
  factory _$HabitCopyWith(_Habit value, $Res Function(_Habit) _then) = __$HabitCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, DateTime createdDate, int? colorValue, FrequencyType frequencyType, Set<int> weeklyDays
});




}
/// @nodoc
class __$HabitCopyWithImpl<$Res>
    implements _$HabitCopyWith<$Res> {
  __$HabitCopyWithImpl(this._self, this._then);

  final _Habit _self;
  final $Res Function(_Habit) _then;

/// Create a copy of Habit
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? createdDate = null,Object? colorValue = freezed,Object? frequencyType = null,Object? weeklyDays = null,}) {
  return _then(_Habit(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,createdDate: null == createdDate ? _self.createdDate : createdDate // ignore: cast_nullable_to_non_nullable
as DateTime,colorValue: freezed == colorValue ? _self.colorValue : colorValue // ignore: cast_nullable_to_non_nullable
as int?,frequencyType: null == frequencyType ? _self.frequencyType : frequencyType // ignore: cast_nullable_to_non_nullable
as FrequencyType,weeklyDays: null == weeklyDays ? _self._weeklyDays : weeklyDays // ignore: cast_nullable_to_non_nullable
as Set<int>,
  ));
}


}

// dart format on
