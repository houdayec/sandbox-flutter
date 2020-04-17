import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterdddarchitecture/domain/auth/auth_failures.dart';

import 'value_objects.dart';

// Interface to implement login and signin methods

abstract class IAuthFacade {
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    @required EmailAddress email,
    @required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    @required EmailAddress email,
    @required Password password,
  });

  Future<Either<AuthFailure, Unit>> signInWithGoogle();
}
