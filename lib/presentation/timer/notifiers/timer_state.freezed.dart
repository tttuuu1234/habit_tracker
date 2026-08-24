// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'timer_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TimerState {

/// 習慣名。
 String get habitName;/// 目標時間（秒）。
 int get targetSeconds;/// 残り時間（秒）。
 int get remainingSeconds;/// タイマー実行中かどうか。
 bool get isRunning;/// タイマーが完了したかどうか。
 bool get isCompleted;/// バックグラウンド移行時刻。
 DateTime? get pausedAt;
/// Create a copy of TimerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TimerStateCopyWith<TimerState> get copyWith => _$TimerStateCopyWithImpl<TimerState>(this as TimerState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TimerState&&(identical(other.habitName, habitName) || other.habitName == habitName)&&(identical(other.targetSeconds, targetSeconds) || other.targetSeconds == targetSeconds)&&(identical(other.remainingSeconds, remainingSeconds) || other.remainingSeconds == remainingSeconds)&&(identical(other.isRunning, isRunning) || other.isRunning == isRunning)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.pausedAt, pausedAt) || other.pausedAt == pausedAt));
}


@override
int get hashCode => Object.hash(runtimeType,habitName,targetSeconds,remainingSeconds,isRunning,isCompleted,pausedAt);

@override
String toString() {
  return 'TimerState(habitName: $habitName, targetSeconds: $targetSeconds, remainingSeconds: $remainingSeconds, isRunning: $isRunning, isCompleted: $isCompleted, pausedAt: $pausedAt)';
}


}

/// @nodoc
abstract mixin class $TimerStateCopyWith<$Res>  {
  factory $TimerStateCopyWith(TimerState value, $Res Function(TimerState) _then) = _$TimerStateCopyWithImpl;
@useResult
$Res call({
 String habitName, int targetSeconds, int remainingSeconds, bool isRunning, bool isCompleted, DateTime? pausedAt
});




}
/// @nodoc
class _$TimerStateCopyWithImpl<$Res>
    implements $TimerStateCopyWith<$Res> {
  _$TimerStateCopyWithImpl(this._self, this._then);

  final TimerState _self;
  final $Res Function(TimerState) _then;

/// Create a copy of TimerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? habitName = null,Object? targetSeconds = null,Object? remainingSeconds = null,Object? isRunning = null,Object? isCompleted = null,Object? pausedAt = freezed,}) {
  return _then(_self.copyWith(
habitName: null == habitName ? _self.habitName : habitName // ignore: cast_nullable_to_non_nullable
as String,targetSeconds: null == targetSeconds ? _self.targetSeconds : targetSeconds // ignore: cast_nullable_to_non_nullable
as int,remainingSeconds: null == remainingSeconds ? _self.remainingSeconds : remainingSeconds // ignore: cast_nullable_to_non_nullable
as int,isRunning: null == isRunning ? _self.isRunning : isRunning // ignore: cast_nullable_to_non_nullable
as bool,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,pausedAt: freezed == pausedAt ? _self.pausedAt : pausedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [TimerState].
extension TimerStatePatterns on TimerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TimerState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TimerState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TimerState value)  $default,){
final _that = this;
switch (_that) {
case _TimerState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TimerState value)?  $default,){
final _that = this;
switch (_that) {
case _TimerState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String habitName,  int targetSeconds,  int remainingSeconds,  bool isRunning,  bool isCompleted,  DateTime? pausedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TimerState() when $default != null:
return $default(_that.habitName,_that.targetSeconds,_that.remainingSeconds,_that.isRunning,_that.isCompleted,_that.pausedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String habitName,  int targetSeconds,  int remainingSeconds,  bool isRunning,  bool isCompleted,  DateTime? pausedAt)  $default,) {final _that = this;
switch (_that) {
case _TimerState():
return $default(_that.habitName,_that.targetSeconds,_that.remainingSeconds,_that.isRunning,_that.isCompleted,_that.pausedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String habitName,  int targetSeconds,  int remainingSeconds,  bool isRunning,  bool isCompleted,  DateTime? pausedAt)?  $default,) {final _that = this;
switch (_that) {
case _TimerState() when $default != null:
return $default(_that.habitName,_that.targetSeconds,_that.remainingSeconds,_that.isRunning,_that.isCompleted,_that.pausedAt);case _:
  return null;

}
}

}

/// @nodoc


class _TimerState extends TimerState {
  const _TimerState({required this.habitName, required this.targetSeconds, required this.remainingSeconds, this.isRunning = false, this.isCompleted = false, this.pausedAt}): super._();
  

/// 習慣名。
@override final  String habitName;
/// 目標時間（秒）。
@override final  int targetSeconds;
/// 残り時間（秒）。
@override final  int remainingSeconds;
/// タイマー実行中かどうか。
@override@JsonKey() final  bool isRunning;
/// タイマーが完了したかどうか。
@override@JsonKey() final  bool isCompleted;
/// バックグラウンド移行時刻。
@override final  DateTime? pausedAt;

/// Create a copy of TimerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TimerStateCopyWith<_TimerState> get copyWith => __$TimerStateCopyWithImpl<_TimerState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TimerState&&(identical(other.habitName, habitName) || other.habitName == habitName)&&(identical(other.targetSeconds, targetSeconds) || other.targetSeconds == targetSeconds)&&(identical(other.remainingSeconds, remainingSeconds) || other.remainingSeconds == remainingSeconds)&&(identical(other.isRunning, isRunning) || other.isRunning == isRunning)&&(identical(other.isCompleted, isCompleted) || other.isCompleted == isCompleted)&&(identical(other.pausedAt, pausedAt) || other.pausedAt == pausedAt));
}


@override
int get hashCode => Object.hash(runtimeType,habitName,targetSeconds,remainingSeconds,isRunning,isCompleted,pausedAt);

@override
String toString() {
  return 'TimerState(habitName: $habitName, targetSeconds: $targetSeconds, remainingSeconds: $remainingSeconds, isRunning: $isRunning, isCompleted: $isCompleted, pausedAt: $pausedAt)';
}


}

/// @nodoc
abstract mixin class _$TimerStateCopyWith<$Res> implements $TimerStateCopyWith<$Res> {
  factory _$TimerStateCopyWith(_TimerState value, $Res Function(_TimerState) _then) = __$TimerStateCopyWithImpl;
@override @useResult
$Res call({
 String habitName, int targetSeconds, int remainingSeconds, bool isRunning, bool isCompleted, DateTime? pausedAt
});




}
/// @nodoc
class __$TimerStateCopyWithImpl<$Res>
    implements _$TimerStateCopyWith<$Res> {
  __$TimerStateCopyWithImpl(this._self, this._then);

  final _TimerState _self;
  final $Res Function(_TimerState) _then;

/// Create a copy of TimerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? habitName = null,Object? targetSeconds = null,Object? remainingSeconds = null,Object? isRunning = null,Object? isCompleted = null,Object? pausedAt = freezed,}) {
  return _then(_TimerState(
habitName: null == habitName ? _self.habitName : habitName // ignore: cast_nullable_to_non_nullable
as String,targetSeconds: null == targetSeconds ? _self.targetSeconds : targetSeconds // ignore: cast_nullable_to_non_nullable
as int,remainingSeconds: null == remainingSeconds ? _self.remainingSeconds : remainingSeconds // ignore: cast_nullable_to_non_nullable
as int,isRunning: null == isRunning ? _self.isRunning : isRunning // ignore: cast_nullable_to_non_nullable
as bool,isCompleted: null == isCompleted ? _self.isCompleted : isCompleted // ignore: cast_nullable_to_non_nullable
as bool,pausedAt: freezed == pausedAt ? _self.pausedAt : pausedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
