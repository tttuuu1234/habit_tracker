// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'habit_form_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$HabitFormState {

/// 習慣名。
 String get name;/// 頻度種別。
 FrequencyType get frequencyType;/// 曜日指定時の対象曜日（1=月〜7=日）。
 Set<int> get weeklyDays;/// 選択中のカラー。
 Color? get color;/// 編集対象の習慣ID（nullなら作成モード）。
 int? get editingHabitId;/// 保存処理中かどうか。
 bool get isSaving;/// 習慣の種別。
 HabitType get habitType;/// 目標時間（分）。時間方式の場合のみ使用。
 int? get targetTime;
/// Create a copy of HabitFormState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HabitFormStateCopyWith<HabitFormState> get copyWith => _$HabitFormStateCopyWithImpl<HabitFormState>(this as HabitFormState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HabitFormState&&(identical(other.name, name) || other.name == name)&&(identical(other.frequencyType, frequencyType) || other.frequencyType == frequencyType)&&const DeepCollectionEquality().equals(other.weeklyDays, weeklyDays)&&(identical(other.color, color) || other.color == color)&&(identical(other.editingHabitId, editingHabitId) || other.editingHabitId == editingHabitId)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.habitType, habitType) || other.habitType == habitType)&&(identical(other.targetTime, targetTime) || other.targetTime == targetTime));
}


@override
int get hashCode => Object.hash(runtimeType,name,frequencyType,const DeepCollectionEquality().hash(weeklyDays),color,editingHabitId,isSaving,habitType,targetTime);

@override
String toString() {
  return 'HabitFormState(name: $name, frequencyType: $frequencyType, weeklyDays: $weeklyDays, color: $color, editingHabitId: $editingHabitId, isSaving: $isSaving, habitType: $habitType, targetTime: $targetTime)';
}


}

/// @nodoc
abstract mixin class $HabitFormStateCopyWith<$Res>  {
  factory $HabitFormStateCopyWith(HabitFormState value, $Res Function(HabitFormState) _then) = _$HabitFormStateCopyWithImpl;
@useResult
$Res call({
 String name, FrequencyType frequencyType, Set<int> weeklyDays, Color? color, int? editingHabitId, bool isSaving, HabitType habitType, int? targetTime
});




}
/// @nodoc
class _$HabitFormStateCopyWithImpl<$Res>
    implements $HabitFormStateCopyWith<$Res> {
  _$HabitFormStateCopyWithImpl(this._self, this._then);

  final HabitFormState _self;
  final $Res Function(HabitFormState) _then;

/// Create a copy of HabitFormState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? frequencyType = null,Object? weeklyDays = null,Object? color = freezed,Object? editingHabitId = freezed,Object? isSaving = null,Object? habitType = null,Object? targetTime = freezed,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,frequencyType: null == frequencyType ? _self.frequencyType : frequencyType // ignore: cast_nullable_to_non_nullable
as FrequencyType,weeklyDays: null == weeklyDays ? _self.weeklyDays : weeklyDays // ignore: cast_nullable_to_non_nullable
as Set<int>,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color?,editingHabitId: freezed == editingHabitId ? _self.editingHabitId : editingHabitId // ignore: cast_nullable_to_non_nullable
as int?,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,habitType: null == habitType ? _self.habitType : habitType // ignore: cast_nullable_to_non_nullable
as HabitType,targetTime: freezed == targetTime ? _self.targetTime : targetTime // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [HabitFormState].
extension HabitFormStatePatterns on HabitFormState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _HabitFormState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _HabitFormState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _HabitFormState value)  $default,){
final _that = this;
switch (_that) {
case _HabitFormState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _HabitFormState value)?  $default,){
final _that = this;
switch (_that) {
case _HabitFormState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String name,  FrequencyType frequencyType,  Set<int> weeklyDays,  Color? color,  int? editingHabitId,  bool isSaving,  HabitType habitType,  int? targetTime)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _HabitFormState() when $default != null:
return $default(_that.name,_that.frequencyType,_that.weeklyDays,_that.color,_that.editingHabitId,_that.isSaving,_that.habitType,_that.targetTime);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String name,  FrequencyType frequencyType,  Set<int> weeklyDays,  Color? color,  int? editingHabitId,  bool isSaving,  HabitType habitType,  int? targetTime)  $default,) {final _that = this;
switch (_that) {
case _HabitFormState():
return $default(_that.name,_that.frequencyType,_that.weeklyDays,_that.color,_that.editingHabitId,_that.isSaving,_that.habitType,_that.targetTime);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String name,  FrequencyType frequencyType,  Set<int> weeklyDays,  Color? color,  int? editingHabitId,  bool isSaving,  HabitType habitType,  int? targetTime)?  $default,) {final _that = this;
switch (_that) {
case _HabitFormState() when $default != null:
return $default(_that.name,_that.frequencyType,_that.weeklyDays,_that.color,_that.editingHabitId,_that.isSaving,_that.habitType,_that.targetTime);case _:
  return null;

}
}

}

/// @nodoc


class _HabitFormState extends HabitFormState {
  const _HabitFormState({this.name = '', this.frequencyType = FrequencyType.daily, final  Set<int> weeklyDays = const {}, this.color = null, this.editingHabitId = null, this.isSaving = false, this.habitType = HabitType.check, this.targetTime = null}): _weeklyDays = weeklyDays,super._();
  

/// 習慣名。
@override@JsonKey() final  String name;
/// 頻度種別。
@override@JsonKey() final  FrequencyType frequencyType;
/// 曜日指定時の対象曜日（1=月〜7=日）。
 final  Set<int> _weeklyDays;
/// 曜日指定時の対象曜日（1=月〜7=日）。
@override@JsonKey() Set<int> get weeklyDays {
  if (_weeklyDays is EqualUnmodifiableSetView) return _weeklyDays;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_weeklyDays);
}

/// 選択中のカラー。
@override@JsonKey() final  Color? color;
/// 編集対象の習慣ID（nullなら作成モード）。
@override@JsonKey() final  int? editingHabitId;
/// 保存処理中かどうか。
@override@JsonKey() final  bool isSaving;
/// 習慣の種別。
@override@JsonKey() final  HabitType habitType;
/// 目標時間（分）。時間方式の場合のみ使用。
@override@JsonKey() final  int? targetTime;

/// Create a copy of HabitFormState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HabitFormStateCopyWith<_HabitFormState> get copyWith => __$HabitFormStateCopyWithImpl<_HabitFormState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HabitFormState&&(identical(other.name, name) || other.name == name)&&(identical(other.frequencyType, frequencyType) || other.frequencyType == frequencyType)&&const DeepCollectionEquality().equals(other._weeklyDays, _weeklyDays)&&(identical(other.color, color) || other.color == color)&&(identical(other.editingHabitId, editingHabitId) || other.editingHabitId == editingHabitId)&&(identical(other.isSaving, isSaving) || other.isSaving == isSaving)&&(identical(other.habitType, habitType) || other.habitType == habitType)&&(identical(other.targetTime, targetTime) || other.targetTime == targetTime));
}


@override
int get hashCode => Object.hash(runtimeType,name,frequencyType,const DeepCollectionEquality().hash(_weeklyDays),color,editingHabitId,isSaving,habitType,targetTime);

@override
String toString() {
  return 'HabitFormState(name: $name, frequencyType: $frequencyType, weeklyDays: $weeklyDays, color: $color, editingHabitId: $editingHabitId, isSaving: $isSaving, habitType: $habitType, targetTime: $targetTime)';
}


}

/// @nodoc
abstract mixin class _$HabitFormStateCopyWith<$Res> implements $HabitFormStateCopyWith<$Res> {
  factory _$HabitFormStateCopyWith(_HabitFormState value, $Res Function(_HabitFormState) _then) = __$HabitFormStateCopyWithImpl;
@override @useResult
$Res call({
 String name, FrequencyType frequencyType, Set<int> weeklyDays, Color? color, int? editingHabitId, bool isSaving, HabitType habitType, int? targetTime
});




}
/// @nodoc
class __$HabitFormStateCopyWithImpl<$Res>
    implements _$HabitFormStateCopyWith<$Res> {
  __$HabitFormStateCopyWithImpl(this._self, this._then);

  final _HabitFormState _self;
  final $Res Function(_HabitFormState) _then;

/// Create a copy of HabitFormState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? frequencyType = null,Object? weeklyDays = null,Object? color = freezed,Object? editingHabitId = freezed,Object? isSaving = null,Object? habitType = null,Object? targetTime = freezed,}) {
  return _then(_HabitFormState(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,frequencyType: null == frequencyType ? _self.frequencyType : frequencyType // ignore: cast_nullable_to_non_nullable
as FrequencyType,weeklyDays: null == weeklyDays ? _self._weeklyDays : weeklyDays // ignore: cast_nullable_to_non_nullable
as Set<int>,color: freezed == color ? _self.color : color // ignore: cast_nullable_to_non_nullable
as Color?,editingHabitId: freezed == editingHabitId ? _self.editingHabitId : editingHabitId // ignore: cast_nullable_to_non_nullable
as int?,isSaving: null == isSaving ? _self.isSaving : isSaving // ignore: cast_nullable_to_non_nullable
as bool,habitType: null == habitType ? _self.habitType : habitType // ignore: cast_nullable_to_non_nullable
as HabitType,targetTime: freezed == targetTime ? _self.targetTime : targetTime // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
