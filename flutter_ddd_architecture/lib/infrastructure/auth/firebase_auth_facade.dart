import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutterdddarchitecture/domain/auth/auth_failures.dart';
import 'package:flutterdddarchitecture/domain/auth/i_auth_facade.dart';
import 'package:flutterdddarchitecture/domain/auth/value_objects.dart';
import 'package:flutterdddarchitecture/domain/core/errors.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthFacade implements IAuthFacade{
  
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  FirebaseAuthFacade(this._firebaseAuth, this._googleSignIn);

  @override
  Future<Either<AuthFailure, Unit>> registerWithEmailAndPassword({
    @required EmailAddress email, @required Password password,}) async {

      final emailString = email.getOrCrash();
      final passwordString = password.getOrCrash();

      try{
        await _firebaseAuth.createUserWithEmailAndPassword(email: emailString, password: passwordString);
        return right(unit);
      } on PlatformException catch (e) {
        if(e.code == 'ERROR_EMAIL_ALREADY_IN_USE'){
          return left(const AuthFailure.emailAlreadyInUse());
        }else{
          return left(const AuthFailure.serverError());
        }
      }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithEmailAndPassword({
    @required EmailAddress email, @required Password password}) async {
      
    final emailString = email.getOrCrash();
      final passwordString = password.getOrCrash();

      try{
        await _firebaseAuth.signInWithEmailAndPassword(email: emailString, password: passwordString);
        return right(unit);
      } on PlatformException catch (e) {
        if(e.code == 'ERROR_WRONG_PASSWORD' || e.code == 'ERROR_INVALID_EMAIL'){
          return left(const AuthFailure.invalidEmailAndPassword());
        }else{
          return left(const AuthFailure.serverError());
        }
      }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithGoogle() async {
    try{

      final googleUser = await _googleSignIn.signIn();
      if(googleUser == null){
        return left(AuthFailure.cancelledByUser());
      }
      
      final googleAuth = await googleUser.authentication;

      final authCredentials = GoogleAuthProvider.getCredential(idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

      return _firebaseAuth.signInWithCredential(authCredentials).then((r) => right(unit));
    } on PlatformException catch (e) {
      return left(const AuthFailure.serverError());
    }
    
  }

}