import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterdddarchitecture/domain/auth/value_objects.dart';
import 'package:flutterdddarchitecture/domain/core/errors.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import 'failures.dart';

// Generic class for handling data and exceptions
@immutable
abstract class ValueObject<T> {

  const ValueObject();
  Either<ValueFailure<T>, T> get value;

  /// Throws [UnexpectedValueError]
  T getOrCrash() {
    return value.fold((fail) => throw UnexpectedValueError(fail), (r) => r)
  }

  bool isValid() => value.isRight();

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is ValueObject<T> && value == other.value;

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() {
    return 'Value{value: $value}';
  }

}