// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'archive_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ArchivedHabit {

/// 習慣ID。
 int get id;/// 習慣名。
 String get name;/// テーマカラーの値。
 int? get colorValue;
/// Create a copy of ArchivedHabit
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ArchivedHabitCopyWith<ArchivedHabit> get copyWith => _$ArchivedHabitCopyWithImpl<ArchivedHabit>(this as ArchivedHabit, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ArchivedHabit&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.colorValue, colorValue) || other.colorValue == colorValue));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,colorValue);

@override
String toString() {
  return 'ArchivedHabit(id: $id, name: $name, colorValue: $colorValue)';
}


}

/// @nodoc
abstract mixin class $ArchivedHabitCopyWith<$Res>  {
  factory $ArchivedHabitCopyWith(ArchivedHabit value, $Res Function(ArchivedHabit) _then) = _$ArchivedHabitCopyWithImpl;
@useResult
$Res call({
 int id, String name, int? colorValue
});




}
/// @nodoc
class _$ArchivedHabitCopyWithImpl<$Res>
    implements $ArchivedHabitCopyWith<$Res> {
  _$ArchivedHabitCopyWithImpl(this._self, this._then);

  final ArchivedHabit _self;
  final $Res Function(ArchivedHabit) _then;

/// Create a copy of ArchivedHabit
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? colorValue = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,colorValue: freezed == colorValue ? _self.colorValue : colorValue // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [ArchivedHabit].
extension ArchivedHabitPatterns on ArchivedHabit {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ArchivedHabit value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ArchivedHabit() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ArchivedHabit value)  $default,){
final _that = this;
switch (_that) {
case _ArchivedHabit():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ArchivedHabit value)?  $default,){
final _that = this;
switch (_that) {
case _ArchivedHabit() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  int? colorValue)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ArchivedHabit() when $default != null:
return $default(_that.id,_that.name,_that.colorValue);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  int? colorValue)  $default,) {final _that = this;
switch (_that) {
case _ArchivedHabit():
return $default(_that.id,_that.name,_that.colorValue);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  int? colorValue)?  $default,) {final _that = this;
switch (_that) {
case _ArchivedHabit() when $default != null:
return $default(_that.id,_that.name,_that.colorValue);case _:
  return null;

}
}

}

/// @nodoc


class _ArchivedHabit implements ArchivedHabit {
  const _ArchivedHabit({required this.id, required this.name, required this.colorValue});
  

/// 習慣ID。
@override final  int id;
/// 習慣名。
@override final  String name;
/// テーマカラーの値。
@override final  int? colorValue;

/// Create a copy of ArchivedHabit
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ArchivedHabitCopyWith<_ArchivedHabit> get copyWith => __$ArchivedHabitCopyWithImpl<_ArchivedHabit>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ArchivedHabit&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.colorValue, colorValue) || other.colorValue == colorValue));
}


@override
int get hashCode => Object.hash(runtimeType,id,name,colorValue);

@override
String toString() {
  return 'ArchivedHabit(id: $id, name: $name, colorValue: $colorValue)';
}


}

/// @nodoc
abstract mixin class _$ArchivedHabitCopyWith<$Res> implements $ArchivedHabitCopyWith<$Res> {
  factory _$ArchivedHabitCopyWith(_ArchivedHabit value, $Res Function(_ArchivedHabit) _then) = __$ArchivedHabitCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, int? colorValue
});




}
/// @nodoc
class __$ArchivedHabitCopyWithImpl<$Res>
    implements _$ArchivedHabitCopyWith<$Res> {
  __$ArchivedHabitCopyWithImpl(this._self, this._then);

  final _ArchivedHabit _self;
  final $Res Function(_ArchivedHabit) _then;

/// Create a copy of ArchivedHabit
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? colorValue = freezed,}) {
  return _then(_ArchivedHabit(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,colorValue: freezed == colorValue ? _self.colorValue : colorValue // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
