// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HabitDetailState {

 String get habitName; DateTime get habitCreatedDate; Color? get habitColor; Set<DateTime> get completionDates; DateTime get displayMonth;
/// Create a copy of HabitDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HabitDetailStateCopyWith<HabitDetailState> get copyWith => _$HabitDetailStateCopyWithImpl<HabitDetailState>(this as HabitDetailState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HabitDetailState&&(identical(other.habitName, habitName) || other.habitName == habitName)&&(identical(other.habitCreatedDate, habitCreatedDate) || other.habitCreatedDate == habitCreatedDate)&&(identical(other.habitColor, habitColor) || other.habitColor == habitColor)&&const DeepCollectionEquality().equals(other.completionDates, completionDates)&&(identical(other.displayMonth, displayMonth) || other.displayMonth == displayMonth));
}


@override
int get hashCode => Object.hash(runtimeType,habitName,habitCreatedDate,habitColor,const DeepCollectionEquality().hash(completionDates),displayMonth);

@override
String toString() {
  return 'HabitDetailState(habitName: $habitName, habitCreatedDate: $habitCreatedDate, habitColor: $habitColor, completionDates: $completionDates, displayMonth: $displayMonth)';
}


}

/// @nodoc
abstract mixin class $HabitDetailStateCopyWith<$Res>  {
  factory $HabitDetailStateCopyWith(HabitDetailState value, $Res Function(HabitDetailState) _then) = _$HabitDetailStateCopyWithImpl;
@useResult
$Res call({
 String habitName, DateTime habitCreatedDate, Color? habitColor, Set<DateTime> completionDates, DateTime displayMonth
});




}
/// @nodoc
class _$HabitDetailStateCopyWithImpl<$Res>
    implements $HabitDetailStateCopyWith<$Res> {
  _$HabitDetailStateCopyWithImpl(this._self, this._then);

  final HabitDetailState _self;
  final $Res Function(HabitDetailState) _then;

/// Create a copy of HabitDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? habitName = null,Object? habitCreatedDate = null,Object? habitColor = freezed,Object? completionDates = null,Object? displayMonth = null,}) {
  return _then(_self.copyWith(
habitName: null == habitName ? _self.habitName : habitName // ignore: cast_nullable_to_non_nullable
as String,habitCreatedDate: null == habitCreatedDate ? _self.habitCreatedDate : habitCreatedDate // ignore: cast_nullable_to_non_nullable
as DateTime,habitColor: freezed == habitColor ? _self.habitColor : habitColor // ignore: cast_nullable_to_non_nullable
as Color?,completionDates: null == completionDates ? _self.completionDates : completionDates // ignore: cast_nullable_to_non_nullable
as Set<DateTime>,displayMonth: null == displayMonth ? _self.displayMonth : displayMonth // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}

}


/// Adds pattern-matching-related methods to [HabitDetailState].
extension HabitDetailStatePatterns on HabitDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HabitDetailState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HabitDetailState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HabitDetailState value)  $default,){
final _that = this;
switch (_that) {
case _HabitDetailState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HabitDetailState value)?  $default,){
final _that = this;
switch (_that) {
case _HabitDetailState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String habitName,  DateTime habitCreatedDate,  Color? habitColor,  Set<DateTime> completionDates,  DateTime displayMonth)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HabitDetailState() when $default != null:
return $default(_that.habitName,_that.habitCreatedDate,_that.habitColor,_that.completionDates,_that.displayMonth);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String habitName,  DateTime habitCreatedDate,  Color? habitColor,  Set<DateTime> completionDates,  DateTime displayMonth)  $default,) {final _that = this;
switch (_that) {
case _HabitDetailState():
return $default(_that.habitName,_that.habitCreatedDate,_that.habitColor,_that.completionDates,_that.displayMonth);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String habitName,  DateTime habitCreatedDate,  Color? habitColor,  Set<DateTime> completionDates,  DateTime displayMonth)?  $default,) {final _that = this;
switch (_that) {
case _HabitDetailState() when $default != null:
return $default(_that.habitName,_that.habitCreatedDate,_that.habitColor,_that.completionDates,_that.displayMonth);case _:
  return null;

}
}

}

/// @nodoc


class _HabitDetailState extends HabitDetailState {
  const _HabitDetailState({required this.habitName, required this.habitCreatedDate, required this.habitColor, required final  Set<DateTime> completionDates, required this.displayMonth}): _completionDates = completionDates,super._();
  

@override final  String habitName;
@override final  DateTime habitCreatedDate;
@override final  Color? habitColor;
 final  Set<DateTime> _completionDates;
@override Set<DateTime> get completionDates {
  if (_completionDates is EqualUnmodifiableSetView) return _completionDates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_completionDates);
}

@override final  DateTime displayMonth;

/// Create a copy of HabitDetailState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HabitDetailStateCopyWith<_HabitDetailState> get copyWith => __$HabitDetailStateCopyWithImpl<_HabitDetailState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HabitDetailState&&(identical(other.habitName, habitName) || other.habitName == habitName)&&(identical(other.habitCreatedDate, habitCreatedDate) || other.habitCreatedDate == habitCreatedDate)&&(identical(other.habitColor, habitColor) || other.habitColor == habitColor)&&const DeepCollectionEquality().equals(other._completionDates, _completionDates)&&(identical(other.displayMonth, displayMonth) || other.displayMonth == displayMonth));
}


@override
int get hashCode => Object.hash(runtimeType,habitName,habitCreatedDate,habitColor,const DeepCollectionEquality().hash(_completionDates),displayMonth);

@override
String toString() {
  return 'HabitDetailState(habitName: $habitName, habitCreatedDate: $habitCreatedDate, habitColor: $habitColor, completionDates: $completionDates, displayMonth: $displayMonth)';
}


}

/// @nodoc
abstract mixin class _$HabitDetailStateCopyWith<$Res> implements $HabitDetailStateCopyWith<$Res> {
  factory _$HabitDetailStateCopyWith(_HabitDetailState value, $Res Function(_HabitDetailState) _then) = __$HabitDetailStateCopyWithImpl;
@override @useResult
$Res call({
 String habitName, DateTime habitCreatedDate, Color? habitColor, Set<DateTime> completionDates, DateTime displayMonth
});




}
/// @nodoc
class __$HabitDetailStateCopyWithImpl<$Res>
    implements _$HabitDetailStateCopyWith<$Res> {
  __$HabitDetailStateCopyWithImpl(this._self, this._then);

  final _HabitDetailState _self;
  final $Res Function(_HabitDetailState) _then;

/// Create a copy of HabitDetailState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? habitName = null,Object? habitCreatedDate = null,Object? habitColor = freezed,Object? completionDates = null,Object? displayMonth = null,}) {
  return _then(_HabitDetailState(
habitName: null == habitName ? _self.habitName : habitName // ignore: cast_nullable_to_non_nullable
as String,habitCreatedDate: null == habitCreatedDate ? _self.habitCreatedDate : habitCreatedDate // ignore: cast_nullable_to_non_nullable
as DateTime,habitColor: freezed == habitColor ? _self.habitColor : habitColor // ignore: cast_nullable_to_non_nullable
as Color?,completionDates: null == completionDates ? _self._completionDates : completionDates // ignore: cast_nullable_to_non_nullable
as Set<DateTime>,displayMonth: null == displayMonth ? _self.displayMonth : displayMonth // ignore: cast_nullable_to_non_nullable
as DateTime,
  ));
}


}

// dart format on
