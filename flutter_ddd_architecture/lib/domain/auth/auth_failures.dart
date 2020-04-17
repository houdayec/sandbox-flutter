import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_failures.freezed.dart';

// All our possible failures
// We first type our desired function name then we save and freeze generates them
@freezed
abstract class AuthFailure<T> with _$AuthFailure<T> {
  const factory AuthFailure.cancelledByUser() = CancelledByUser;
  const factory AuthFailure.serverError() = ServerError;
  const factory AuthFailure.emailAlreadyInUse() = EmailAlreadyInUse;
  const factory AuthFailure.invalidEmailAndPassword() = InvalidEmailAndPassword;
}
