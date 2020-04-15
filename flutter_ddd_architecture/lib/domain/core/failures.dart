import 'package:freezed_annotation/freezed_annotation.dart';
part 'failures.freezed.dart';

// All our possible failures
// We first type our desired function name then we save and freeze generates them
@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidEmail({
    @required String failedValue,
  }) = InvalidEmail<T>;

  const factory ValueFailure.shortPassword({
    @required String failedValue,
  }) = ShortPassword<T>;
}
