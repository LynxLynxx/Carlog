import 'package:carlog/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

Future<Either<Failure, ResponseType>> handleResponse<ResponseType>(
    ValueGetter<Future<ResponseType>> request) async {
  try {
    final response = await request();
    return Right(response);
  } on FirebaseAuthException catch (e) {
    return Left(_handleFirebaseAuthException(e));
  } catch (e) {
    return Left(_handleCommonErrors(e));
  }
}

Future<Option<Failure>> handleVoidResponse<ResponseType>(
    ValueGetter<Future<ResponseType>> request) async {
  try {
    await request();
    return const None();
  } on FirebaseAuthException catch (e) {
    return Some(_handleFirebaseAuthException(e));
  } catch (e) {
    return Some(_handleCommonErrors(e));
  }
}

Failure _handleFirebaseAuthException(FirebaseAuthException exception) {
  switch (exception.code) {
    case 'account-exists-with-different-credential':
      return const AuthFailure(
        message: 'Account exists with different credentials.',
      );
    case 'invalid-credential':
      return const AuthFailure(
        message: 'The credential received is malformed or has expired.',
      );
    case 'operation-not-allowed':
      return const AuthFailure(
        message: 'Operation is not allowed.  Please contact support.',
      );
    case 'user-disabled':
      return const AuthFailure(
        message:
            'This user has been disabled. Please contact support for help.',
      );
    case 'user-not-found':
      return const AuthFailure(
        message: 'Email is not found, please create an account.',
      );
    case 'wrong-password':
      return const AuthFailure(
        message: 'Incorrect password, please try again.',
      );
    case 'invalid-verification-code':
      return const AuthFailure(
        message: 'The credential verification code received is invalid.',
      );
    case 'invalid-verification-id':
      return const AuthFailure(
        message: 'The credential verification ID received is invalid.',
      );
    case 'invalid-email':
      return const AuthFailure(
        message: 'Email is not valid or badly formatted.',
      );
    case 'email-already-in-use':
      return const AuthFailure(
        message: 'An account already exists for that email.',
      );
    case 'weak-password':
      return const AuthFailure(
        message: 'Please enter a stronger password.',
      );
    default:
      return UnknownFailure.undefinedFirebase(message: exception.code);
  }
}

Failure _handleCommonErrors(Object e) {
  if (e is TypeError) {
    return ParseFailure.typeFailure(stackTrace: e.stackTrace);
  }
  return UnknownFailure.undefined(message: e.toString());
}
