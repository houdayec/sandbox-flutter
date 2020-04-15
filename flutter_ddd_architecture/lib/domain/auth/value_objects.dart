import 'package:dartz/dartz.dart';
import 'package:flutterdddarchitecture/domain/core/failures.dart';
import 'package:flutterdddarchitecture/domain/core/value_objects.dart';
import 'package:flutterdddarchitecture/domain/core/value_validators.dart';

// Our different value classes to validate

class EmailAddress extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String input) {
    assert(input != null);
    return EmailAddress._(validateEmailAddress(input));
  }

  const EmailAddress._(this.value) : assert(value != null);
}

class Password extends ValueObject<String> {
  final Either<ValueFailure<String>, String> value;

  factory Password(String input) {
    assert(input != null);
    return Password._(validatePassword(input));
  }

  const Password._(this.value) : assert(value != null);
}
