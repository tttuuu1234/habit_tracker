// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'graph_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CategoryChartData {

/// カテゴリ（nullは未分類）。
 HabitCategory? get category;/// 表示ラベル。
 String get label;/// カテゴリの色（ARGB int値）。
 int get colorValue;/// 件数。
 int get count;
/// Create a copy of CategoryChartData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryChartDataCopyWith<CategoryChartData> get copyWith => _$CategoryChartDataCopyWithImpl<CategoryChartData>(this as CategoryChartData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryChartData&&(identical(other.category, category) || other.category == category)&&(identical(other.label, label) || other.label == label)&&(identical(other.colorValue, colorValue) || other.colorValue == colorValue)&&(identical(other.count, count) || other.count == count));
}


@override
int get hashCode => Object.hash(runtimeType,category,label,colorValue,count);

@override
String toString() {
  return 'CategoryChartData(category: $category, label: $label, colorValue: $colorValue, count: $count)';
}


}

/// @nodoc
abstract mixin class $CategoryChartDataCopyWith<$Res>  {
  factory $CategoryChartDataCopyWith(CategoryChartData value, $Res Function(CategoryChartData) _then) = _$CategoryChartDataCopyWithImpl;
@useResult
$Res call({
 HabitCategory? category, String label, int colorValue, int count
});




}
/// @nodoc
class _$CategoryChartDataCopyWithImpl<$Res>
    implements $CategoryChartDataCopyWith<$Res> {
  _$CategoryChartDataCopyWithImpl(this._self, this._then);

  final CategoryChartData _self;
  final $Res Function(CategoryChartData) _then;

/// Create a copy of CategoryChartData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? category = freezed,Object? label = null,Object? colorValue = null,Object? count = null,}) {
  return _then(_self.copyWith(
category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as HabitCategory?,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,colorValue: null == colorValue ? _self.colorValue : colorValue // ignore: cast_nullable_to_non_nullable
as int,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryChartData].
extension CategoryChartDataPatterns on CategoryChartData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryChartData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryChartData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryChartData value)  $default,){
final _that = this;
switch (_that) {
case _CategoryChartData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryChartData value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryChartData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( HabitCategory? category,  String label,  int colorValue,  int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryChartData() when $default != null:
return $default(_that.category,_that.label,_that.colorValue,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( HabitCategory? category,  String label,  int colorValue,  int count)  $default,) {final _that = this;
switch (_that) {
case _CategoryChartData():
return $default(_that.category,_that.label,_that.colorValue,_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( HabitCategory? category,  String label,  int colorValue,  int count)?  $default,) {final _that = this;
switch (_that) {
case _CategoryChartData() when $default != null:
return $default(_that.category,_that.label,_that.colorValue,_that.count);case _:
  return null;

}
}

}

/// @nodoc


class _CategoryChartData implements CategoryChartData {
  const _CategoryChartData({required this.category, required this.label, required this.colorValue, required this.count});
  

/// カテゴリ（nullは未分類）。
@override final  HabitCategory? category;
/// 表示ラベル。
@override final  String label;
/// カテゴリの色（ARGB int値）。
@override final  int colorValue;
/// 件数。
@override final  int count;

/// Create a copy of CategoryChartData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryChartDataCopyWith<_CategoryChartData> get copyWith => __$CategoryChartDataCopyWithImpl<_CategoryChartData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryChartData&&(identical(other.category, category) || other.category == category)&&(identical(other.label, label) || other.label == label)&&(identical(other.colorValue, colorValue) || other.colorValue == colorValue)&&(identical(other.count, count) || other.count == count));
}


@override
int get hashCode => Object.hash(runtimeType,category,label,colorValue,count);

@override
String toString() {
  return 'CategoryChartData(category: $category, label: $label, colorValue: $colorValue, count: $count)';
}


}

/// @nodoc
abstract mixin class _$CategoryChartDataCopyWith<$Res> implements $CategoryChartDataCopyWith<$Res> {
  factory _$CategoryChartDataCopyWith(_CategoryChartData value, $Res Function(_CategoryChartData) _then) = __$CategoryChartDataCopyWithImpl;
@override @useResult
$Res call({
 HabitCategory? category, String label, int colorValue, int count
});




}
/// @nodoc
class __$CategoryChartDataCopyWithImpl<$Res>
    implements _$CategoryChartDataCopyWith<$Res> {
  __$CategoryChartDataCopyWithImpl(this._self, this._then);

  final _CategoryChartData _self;
  final $Res Function(_CategoryChartData) _then;

/// Create a copy of CategoryChartData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? category = freezed,Object? label = null,Object? colorValue = null,Object? count = null,}) {
  return _then(_CategoryChartData(
category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as HabitCategory?,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,colorValue: null == colorValue ? _self.colorValue : colorValue // ignore: cast_nullable_to_non_nullable
as int,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc
mixin _$GraphState {

/// カテゴリ別習慣数データ。
 List<CategoryChartData> get habitCountData;/// カテゴリ別達成回数データ。
 List<CategoryChartData> get achievementCountData;
/// Create a copy of GraphState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GraphStateCopyWith<GraphState> get copyWith => _$GraphStateCopyWithImpl<GraphState>(this as GraphState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GraphState&&const DeepCollectionEquality().equals(other.habitCountData, habitCountData)&&const DeepCollectionEquality().equals(other.achievementCountData, achievementCountData));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(habitCountData),const DeepCollectionEquality().hash(achievementCountData));

@override
String toString() {
  return 'GraphState(habitCountData: $habitCountData, achievementCountData: $achievementCountData)';
}


}

/// @nodoc
abstract mixin class $GraphStateCopyWith<$Res>  {
  factory $GraphStateCopyWith(GraphState value, $Res Function(GraphState) _then) = _$GraphStateCopyWithImpl;
@useResult
$Res call({
 List<CategoryChartData> habitCountData, List<CategoryChartData> achievementCountData
});




}
/// @nodoc
class _$GraphStateCopyWithImpl<$Res>
    implements $GraphStateCopyWith<$Res> {
  _$GraphStateCopyWithImpl(this._self, this._then);

  final GraphState _self;
  final $Res Function(GraphState) _then;

/// Create a copy of GraphState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? habitCountData = null,Object? achievementCountData = null,}) {
  return _then(_self.copyWith(
habitCountData: null == habitCountData ? _self.habitCountData : habitCountData // ignore: cast_nullable_to_non_nullable
as List<CategoryChartData>,achievementCountData: null == achievementCountData ? _self.achievementCountData : achievementCountData // ignore: cast_nullable_to_non_nullable
as List<CategoryChartData>,
  ));
}

}


/// Adds pattern-matching-related methods to [GraphState].
extension GraphStatePatterns on GraphState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GraphState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GraphState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GraphState value)  $default,){
final _that = this;
switch (_that) {
case _GraphState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GraphState value)?  $default,){
final _that = this;
switch (_that) {
case _GraphState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CategoryChartData> habitCountData,  List<CategoryChartData> achievementCountData)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GraphState() when $default != null:
return $default(_that.habitCountData,_that.achievementCountData);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CategoryChartData> habitCountData,  List<CategoryChartData> achievementCountData)  $default,) {final _that = this;
switch (_that) {
case _GraphState():
return $default(_that.habitCountData,_that.achievementCountData);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CategoryChartData> habitCountData,  List<CategoryChartData> achievementCountData)?  $default,) {final _that = this;
switch (_that) {
case _GraphState() when $default != null:
return $default(_that.habitCountData,_that.achievementCountData);case _:
  return null;

}
}

}

/// @nodoc


class _GraphState implements GraphState {
  const _GraphState({required final  List<CategoryChartData> habitCountData, required final  List<CategoryChartData> achievementCountData}): _habitCountData = habitCountData,_achievementCountData = achievementCountData;
  

/// カテゴリ別習慣数データ。
 final  List<CategoryChartData> _habitCountData;
/// カテゴリ別習慣数データ。
@override List<CategoryChartData> get habitCountData {
  if (_habitCountData is EqualUnmodifiableListView) return _habitCountData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_habitCountData);
}

/// カテゴリ別達成回数データ。
 final  List<CategoryChartData> _achievementCountData;
/// カテゴリ別達成回数データ。
@override List<CategoryChartData> get achievementCountData {
  if (_achievementCountData is EqualUnmodifiableListView) return _achievementCountData;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_achievementCountData);
}


/// Create a copy of GraphState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GraphStateCopyWith<_GraphState> get copyWith => __$GraphStateCopyWithImpl<_GraphState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GraphState&&const DeepCollectionEquality().equals(other._habitCountData, _habitCountData)&&const DeepCollectionEquality().equals(other._achievementCountData, _achievementCountData));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_habitCountData),const DeepCollectionEquality().hash(_achievementCountData));

@override
String toString() {
  return 'GraphState(habitCountData: $habitCountData, achievementCountData: $achievementCountData)';
}


}

/// @nodoc
abstract mixin class _$GraphStateCopyWith<$Res> implements $GraphStateCopyWith<$Res> {
  factory _$GraphStateCopyWith(_GraphState value, $Res Function(_GraphState) _then) = __$GraphStateCopyWithImpl;
@override @useResult
$Res call({
 List<CategoryChartData> habitCountData, List<CategoryChartData> achievementCountData
});




}
/// @nodoc
class __$GraphStateCopyWithImpl<$Res>
    implements _$GraphStateCopyWith<$Res> {
  __$GraphStateCopyWithImpl(this._self, this._then);

  final _GraphState _self;
  final $Res Function(_GraphState) _then;

/// Create a copy of GraphState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? habitCountData = null,Object? achievementCountData = null,}) {
  return _then(_GraphState(
habitCountData: null == habitCountData ? _self._habitCountData : habitCountData // ignore: cast_nullable_to_non_nullable
as List<CategoryChartData>,achievementCountData: null == achievementCountData ? _self._achievementCountData : achievementCountData // ignore: cast_nullable_to_non_nullable
as List<CategoryChartData>,
  ));
}


}

// dart format on
