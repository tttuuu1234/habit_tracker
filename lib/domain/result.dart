import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

/// 処理結果を成功・失敗で表す型。
@freezed
sealed class Result<T> with _$Result<T> {
  /// 成功。
  const factory Result.success(T value) = Success<T>;

  /// 失敗。
  const factory Result.failure(String message) = Failure<T>;
}
