// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'auth_failures.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$AuthFailure<T> {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result cancelledByUser(),
    @required Result serverError(),
    @required Result emailAlreadyInUse(),
    @required Result invalidEmailAndPassword(),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result cancelledByUser(),
    Result serverError(),
    Result emailAlreadyInUse(),
    Result invalidEmailAndPassword(),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result cancelledByUser(CancelledByUser<T> value),
    @required Result serverError(ServerError<T> value),
    @required Result emailAlreadyInUse(EmailAlreadyInUse<T> value),
    @required Result invalidEmailAndPassword(InvalidEmailAndPassword<T> value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result cancelledByUser(CancelledByUser<T> value),
    Result serverError(ServerError<T> value),
    Result emailAlreadyInUse(EmailAlreadyInUse<T> value),
    Result invalidEmailAndPassword(InvalidEmailAndPassword<T> value),
    @required Result orElse(),
  });
}

class _$AuthFailureTearOff {
  const _$AuthFailureTearOff();

  CancelledByUser<T> cancelledByUser<T>() {
    return CancelledByUser<T>();
  }

  ServerError<T> serverError<T>() {
    return ServerError<T>();
  }

  EmailAlreadyInUse<T> emailAlreadyInUse<T>() {
    return EmailAlreadyInUse<T>();
  }

  InvalidEmailAndPassword<T> invalidEmailAndPassword<T>() {
    return InvalidEmailAndPassword<T>();
  }
}

const $AuthFailure = _$AuthFailureTearOff();

class _$CancelledByUser<T> implements CancelledByUser<T> {
  const _$CancelledByUser();

  @override
  String toString() {
    return 'AuthFailure<$T>.cancelledByUser()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is CancelledByUser<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result cancelledByUser(),
    @required Result serverError(),
    @required Result emailAlreadyInUse(),
    @required Result invalidEmailAndPassword(),
  }) {
    assert(cancelledByUser != null);
    assert(serverError != null);
    assert(emailAlreadyInUse != null);
    assert(invalidEmailAndPassword != null);
    return cancelledByUser();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result cancelledByUser(),
    Result serverError(),
    Result emailAlreadyInUse(),
    Result invalidEmailAndPassword(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (cancelledByUser != null) {
      return cancelledByUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result cancelledByUser(CancelledByUser<T> value),
    @required Result serverError(ServerError<T> value),
    @required Result emailAlreadyInUse(EmailAlreadyInUse<T> value),
    @required Result invalidEmailAndPassword(InvalidEmailAndPassword<T> value),
  }) {
    assert(cancelledByUser != null);
    assert(serverError != null);
    assert(emailAlreadyInUse != null);
    assert(invalidEmailAndPassword != null);
    return cancelledByUser(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result cancelledByUser(CancelledByUser<T> value),
    Result serverError(ServerError<T> value),
    Result emailAlreadyInUse(EmailAlreadyInUse<T> value),
    Result invalidEmailAndPassword(InvalidEmailAndPassword<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (cancelledByUser != null) {
      return cancelledByUser(this);
    }
    return orElse();
  }
}

abstract class CancelledByUser<T> implements AuthFailure<T> {
  const factory CancelledByUser() = _$CancelledByUser<T>;
}

class _$ServerError<T> implements ServerError<T> {
  const _$ServerError();

  @override
  String toString() {
    return 'AuthFailure<$T>.serverError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ServerError<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result cancelledByUser(),
    @required Result serverError(),
    @required Result emailAlreadyInUse(),
    @required Result invalidEmailAndPassword(),
  }) {
    assert(cancelledByUser != null);
    assert(serverError != null);
    assert(emailAlreadyInUse != null);
    assert(invalidEmailAndPassword != null);
    return serverError();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result cancelledByUser(),
    Result serverError(),
    Result emailAlreadyInUse(),
    Result invalidEmailAndPassword(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (serverError != null) {
      return serverError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result cancelledByUser(CancelledByUser<T> value),
    @required Result serverError(ServerError<T> value),
    @required Result emailAlreadyInUse(EmailAlreadyInUse<T> value),
    @required Result invalidEmailAndPassword(InvalidEmailAndPassword<T> value),
  }) {
    assert(cancelledByUser != null);
    assert(serverError != null);
    assert(emailAlreadyInUse != null);
    assert(invalidEmailAndPassword != null);
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result cancelledByUser(CancelledByUser<T> value),
    Result serverError(ServerError<T> value),
    Result emailAlreadyInUse(EmailAlreadyInUse<T> value),
    Result invalidEmailAndPassword(InvalidEmailAndPassword<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class ServerError<T> implements AuthFailure<T> {
  const factory ServerError() = _$ServerError<T>;
}

class _$EmailAlreadyInUse<T> implements EmailAlreadyInUse<T> {
  const _$EmailAlreadyInUse();

  @override
  String toString() {
    return 'AuthFailure<$T>.emailAlreadyInUse()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is EmailAlreadyInUse<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result cancelledByUser(),
    @required Result serverError(),
    @required Result emailAlreadyInUse(),
    @required Result invalidEmailAndPassword(),
  }) {
    assert(cancelledByUser != null);
    assert(serverError != null);
    assert(emailAlreadyInUse != null);
    assert(invalidEmailAndPassword != null);
    return emailAlreadyInUse();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result cancelledByUser(),
    Result serverError(),
    Result emailAlreadyInUse(),
    Result invalidEmailAndPassword(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emailAlreadyInUse != null) {
      return emailAlreadyInUse();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result cancelledByUser(CancelledByUser<T> value),
    @required Result serverError(ServerError<T> value),
    @required Result emailAlreadyInUse(EmailAlreadyInUse<T> value),
    @required Result invalidEmailAndPassword(InvalidEmailAndPassword<T> value),
  }) {
    assert(cancelledByUser != null);
    assert(serverError != null);
    assert(emailAlreadyInUse != null);
    assert(invalidEmailAndPassword != null);
    return emailAlreadyInUse(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result cancelledByUser(CancelledByUser<T> value),
    Result serverError(ServerError<T> value),
    Result emailAlreadyInUse(EmailAlreadyInUse<T> value),
    Result invalidEmailAndPassword(InvalidEmailAndPassword<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emailAlreadyInUse != null) {
      return emailAlreadyInUse(this);
    }
    return orElse();
  }
}

abstract class EmailAlreadyInUse<T> implements AuthFailure<T> {
  const factory EmailAlreadyInUse() = _$EmailAlreadyInUse<T>;
}

class _$InvalidEmailAndPassword<T> implements InvalidEmailAndPassword<T> {
  const _$InvalidEmailAndPassword();

  @override
  String toString() {
    return 'AuthFailure<$T>.invalidEmailAndPassword()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InvalidEmailAndPassword<T>);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result cancelledByUser(),
    @required Result serverError(),
    @required Result emailAlreadyInUse(),
    @required Result invalidEmailAndPassword(),
  }) {
    assert(cancelledByUser != null);
    assert(serverError != null);
    assert(emailAlreadyInUse != null);
    assert(invalidEmailAndPassword != null);
    return invalidEmailAndPassword();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result cancelledByUser(),
    Result serverError(),
    Result emailAlreadyInUse(),
    Result invalidEmailAndPassword(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidEmailAndPassword != null) {
      return invalidEmailAndPassword();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result cancelledByUser(CancelledByUser<T> value),
    @required Result serverError(ServerError<T> value),
    @required Result emailAlreadyInUse(EmailAlreadyInUse<T> value),
    @required Result invalidEmailAndPassword(InvalidEmailAndPassword<T> value),
  }) {
    assert(cancelledByUser != null);
    assert(serverError != null);
    assert(emailAlreadyInUse != null);
    assert(invalidEmailAndPassword != null);
    return invalidEmailAndPassword(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result cancelledByUser(CancelledByUser<T> value),
    Result serverError(ServerError<T> value),
    Result emailAlreadyInUse(EmailAlreadyInUse<T> value),
    Result invalidEmailAndPassword(InvalidEmailAndPassword<T> value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidEmailAndPassword != null) {
      return invalidEmailAndPassword(this);
    }
    return orElse();
  }
}

abstract class InvalidEmailAndPassword<T> implements AuthFailure<T> {
  const factory InvalidEmailAndPassword() = _$InvalidEmailAndPassword<T>;
}
