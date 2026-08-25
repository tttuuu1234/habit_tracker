// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_category_statistics_use_case.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategoryStatistics {

/// カテゴリ別の習慣数。
 Map<HabitCategory?, int> get habitCounts;/// カテゴリ別の達成回数合計。
 Map<HabitCategory?, int> get achievementCounts;
/// Create a copy of CategoryStatistics
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryStatisticsCopyWith<CategoryStatistics> get copyWith => _$CategoryStatisticsCopyWithImpl<CategoryStatistics>(this as CategoryStatistics, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryStatistics&&const DeepCollectionEquality().equals(other.habitCounts, habitCounts)&&const DeepCollectionEquality().equals(other.achievementCounts, achievementCounts));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(habitCounts),const DeepCollectionEquality().hash(achievementCounts));

@override
String toString() {
  return 'CategoryStatistics(habitCounts: $habitCounts, achievementCounts: $achievementCounts)';
}


}

/// @nodoc
abstract mixin class $CategoryStatisticsCopyWith<$Res>  {
  factory $CategoryStatisticsCopyWith(CategoryStatistics value, $Res Function(CategoryStatistics) _then) = _$CategoryStatisticsCopyWithImpl;
@useResult
$Res call({
 Map<HabitCategory?, int> habitCounts, Map<HabitCategory?, int> achievementCounts
});




}
/// @nodoc
class _$CategoryStatisticsCopyWithImpl<$Res>
    implements $CategoryStatisticsCopyWith<$Res> {
  _$CategoryStatisticsCopyWithImpl(this._self, this._then);

  final CategoryStatistics _self;
  final $Res Function(CategoryStatistics) _then;

/// Create a copy of CategoryStatistics
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? habitCounts = null,Object? achievementCounts = null,}) {
  return _then(_self.copyWith(
habitCounts: null == habitCounts ? _self.habitCounts : habitCounts // ignore: cast_nullable_to_non_nullable
as Map<HabitCategory?, int>,achievementCounts: null == achievementCounts ? _self.achievementCounts : achievementCounts // ignore: cast_nullable_to_non_nullable
as Map<HabitCategory?, int>,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryStatistics].
extension CategoryStatisticsPatterns on CategoryStatistics {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryStatistics value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryStatistics() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryStatistics value)  $default,){
final _that = this;
switch (_that) {
case _CategoryStatistics():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryStatistics value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryStatistics() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Map<HabitCategory?, int> habitCounts,  Map<HabitCategory?, int> achievementCounts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryStatistics() when $default != null:
return $default(_that.habitCounts,_that.achievementCounts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Map<HabitCategory?, int> habitCounts,  Map<HabitCategory?, int> achievementCounts)  $default,) {final _that = this;
switch (_that) {
case _CategoryStatistics():
return $default(_that.habitCounts,_that.achievementCounts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Map<HabitCategory?, int> habitCounts,  Map<HabitCategory?, int> achievementCounts)?  $default,) {final _that = this;
switch (_that) {
case _CategoryStatistics() when $default != null:
return $default(_that.habitCounts,_that.achievementCounts);case _:
  return null;

}
}

}

/// @nodoc


class _CategoryStatistics implements CategoryStatistics {
  const _CategoryStatistics({required final  Map<HabitCategory?, int> habitCounts, required final  Map<HabitCategory?, int> achievementCounts}): _habitCounts = habitCounts,_achievementCounts = achievementCounts;
  

/// カテゴリ別の習慣数。
 final  Map<HabitCategory?, int> _habitCounts;
/// カテゴリ別の習慣数。
@override Map<HabitCategory?, int> get habitCounts {
  if (_habitCounts is EqualUnmodifiableMapView) return _habitCounts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_habitCounts);
}

/// カテゴリ別の達成回数合計。
 final  Map<HabitCategory?, int> _achievementCounts;
/// カテゴリ別の達成回数合計。
@override Map<HabitCategory?, int> get achievementCounts {
  if (_achievementCounts is EqualUnmodifiableMapView) return _achievementCounts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_achievementCounts);
}


/// Create a copy of CategoryStatistics
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryStatisticsCopyWith<_CategoryStatistics> get copyWith => __$CategoryStatisticsCopyWithImpl<_CategoryStatistics>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryStatistics&&const DeepCollectionEquality().equals(other._habitCounts, _habitCounts)&&const DeepCollectionEquality().equals(other._achievementCounts, _achievementCounts));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_habitCounts),const DeepCollectionEquality().hash(_achievementCounts));

@override
String toString() {
  return 'CategoryStatistics(habitCounts: $habitCounts, achievementCounts: $achievementCounts)';
}


}

/// @nodoc
abstract mixin class _$CategoryStatisticsCopyWith<$Res> implements $CategoryStatisticsCopyWith<$Res> {
  factory _$CategoryStatisticsCopyWith(_CategoryStatistics value, $Res Function(_CategoryStatistics) _then) = __$CategoryStatisticsCopyWithImpl;
@override @useResult
$Res call({
 Map<HabitCategory?, int> habitCounts, Map<HabitCategory?, int> achievementCounts
});




}
/// @nodoc
class __$CategoryStatisticsCopyWithImpl<$Res>
    implements _$CategoryStatisticsCopyWith<$Res> {
  __$CategoryStatisticsCopyWithImpl(this._self, this._then);

  final _CategoryStatistics _self;
  final $Res Function(_CategoryStatistics) _then;

/// Create a copy of CategoryStatistics
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? habitCounts = null,Object? achievementCounts = null,}) {
  return _then(_CategoryStatistics(
habitCounts: null == habitCounts ? _self._habitCounts : habitCounts // ignore: cast_nullable_to_non_nullable
as Map<HabitCategory?, int>,achievementCounts: null == achievementCounts ? _self._achievementCounts : achievementCounts // ignore: cast_nullable_to_non_nullable
as Map<HabitCategory?, int>,
  ));
}


}

// dart format on
