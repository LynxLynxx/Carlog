import 'package:carlog/core/error/failures.dart';
import 'package:carlog/generated/l10n.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';

Future<Either<Failure, ResponseType>> handleResponse<ResponseType>(
    ValueGetter<Future<ResponseType>> request) async {
  try {
    final response = await request();
    return Right(response);
  } on FirebaseAuthException catch (e) {
    return Left(_handleFirebaseAuthException(e));
  } on FirebaseException catch (e) {
    return Left(_handleFirebaseFirestoreErrors(e));
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
  } on FirebaseException catch (e) {
    return Some(_handleFirebaseFirestoreErrors(e));
  } catch (e) {
    return Some(_handleCommonErrors(e));
  }
}

Future<ResponseType> handleFirestoreDocData<ResponseType>(
  String documentPath,
  ResponseType Function(Map<String, dynamic> doc) onDocumentExists,
) async {
  try {
    final docSnapshot =
        await FirebaseFirestore.instance.doc(documentPath).get();

    if (docSnapshot.exists && docSnapshot.data() != null) {
      return onDocumentExists(docSnapshot.data()!);
    } else {
      throw FirebaseException(plugin: "firestore", code: "not-found");
    }
  } catch (e) {
    throw FirebaseException(
        plugin: "firestore", code: "not-found", message: e.toString());
  }
}

Future<ResponseType> handleFirestoreDoc<ResponseType>(
  DocumentReference document,
  ResponseType Function(DocumentReference doc) onDocumentExists,
) async {
  try {
    final docSnapshot = await document.get();

    if (docSnapshot.exists) {
      return onDocumentExists(document);
    } else {
      throw FirebaseException(plugin: "firestore", code: "not-found");
    }
  } catch (e) {
    throw FirebaseException(
        plugin: "firestore", code: "not-found", message: e.toString());
  }
}

Future<ResponseType> handleFirestoreCollection<ResponseType>(
  CollectionReference collection,
  ResponseType Function(CollectionReference collection) onCollectionExists,
) async {
  try {
    return onCollectionExists(collection);
  } catch (e) {
    throw FirebaseException(
        plugin: "firestore", code: "not-found", message: e.toString());
  }
}

Future<ResponseType> handleFirestoreCollectionData<ResponseType>(
    String collectionPath,
    ResponseType Function(List<QueryDocumentSnapshot<Object?>> collection)
        onCollectionExists,
    {String? conditionField,
    dynamic isEqualToConditionValue,
    dynamic isGreaterThanOrEqualToConditionValue,
    dynamic isLessThanOrEqualToConditionValue}) async {
  try {
    QuerySnapshot<Object?> querySnapshot;

    if (conditionField != null &&
        (isEqualToConditionValue != null ||
            isGreaterThanOrEqualToConditionValue != null ||
            isLessThanOrEqualToConditionValue != null)) {
      querySnapshot = await FirebaseFirestore.instance
          .collection(collectionPath)
          .where(conditionField, isEqualTo: isEqualToConditionValue)
          .where(conditionField,
              isGreaterThanOrEqualTo: isGreaterThanOrEqualToConditionValue)
          .where(conditionField,
              isLessThanOrEqualTo: isLessThanOrEqualToConditionValue)
          .get();
    } else {
      querySnapshot =
          await FirebaseFirestore.instance.collection(collectionPath).get();
    }

    return onCollectionExists(querySnapshot.docs);
  } catch (e) {
    throw FirebaseException(
        plugin: "firestore", code: "not-found", message: e.toString());
  }
}

Future<ResponseType> handleFirebaseStorage<ResponseType>(
  Reference ref,
  Future<ResponseType> Function(Reference ref) onReferenceExists,
) async {
  try {
    return await onReferenceExists(ref);
  } catch (e) {
    throw FirebaseException(
        plugin: "firestore", code: "not-found", message: e.toString());
  }
}

Failure _handleFirebaseAuthException(FirebaseAuthException exception) {
  final tr = S.current;
  switch (exception.code) {
    case 'account-exists-with-different-credential':
      return AuthFailure(
        message: tr.errorAccountExists,
      );
    case 'invalid-credential':
      return AuthFailure(
        message: tr.errorInvalidCredential,
      );
    case 'operation-not-allowed':
      return AuthFailure(
        message: tr.errorOperationNotAllowed,
      );
    case 'user-disabled':
      return AuthFailure(
        message: tr.errorUserDisabled,
      );
    case 'user-not-found':
      return AuthFailure(
        message: tr.errorUserNotFound,
      );
    case 'wrong-password':
      return AuthFailure(
        message: tr.errorInvalidCredential,
      );
    case 'invalid-verification-code':
      return AuthFailure(
        message: tr.errorInvalidVerificationCode,
      );
    case 'invalid-verification-id':
      return AuthFailure(
        message: tr.errorInvalidCerificationId,
      );
    case 'invalid-email':
      return AuthFailure(
        message: tr.errorInvalidEmail,
      );
    case 'email-already-in-use':
      return AuthFailure(
        message: tr.errorInvalidCredential,
      );
    case 'weak-password':
      return AuthFailure(
        message: tr.errorWeakPassword,
      );
    default:
      return UnknownFailure.undefinedFirebase(message: exception.code);
  }
}

Failure _handleFirebaseFirestoreErrors(FirebaseException firebaseException) {
  final tr = S.current;
  switch (firebaseException.code) {
    case 'aborted':
      return FirestoreFailure(message: tr.errorAborted);
    case "already-exists":
      return FirestoreFailure(message: tr.errorAlreadyExists);
    case "canceled":
      return FirestoreFailure(message: tr.errorCancled);
    case "data-loss":
      return FirestoreFailure(message: tr.errorDataLoss);
    case "deadline-exceeded":
      return FirestoreFailure(message: tr.errorDeadlineExceeded);

    case "failed_precondition":
      return FirestoreFailure(message: tr.errorFailedPrecondition);
    case "interal":
      return FirestoreFailure(message: tr.errorInternal);
    case "invalid_argument":
      return FirestoreFailure(message: tr.errorInvalidArgument);
    case "not-found":
      return FirestoreFailure(message: tr.errorNotFound);
    case "out-of-range":
      return FirestoreFailure(message: tr.errorOutOfRange);
    case "resourse-exhausted":
      return FirestoreFailure(message: tr.errorResourceExhausted);

    case "unauthenticated":
      return FirestoreFailure(message: tr.errorUnauthenticated);
    case "unavailable":
      return FirestoreFailure(message: tr.errorUnavailable);
    case "unimplemented":
      return FirestoreFailure(message: tr.errorUnimplemented);
    case "unknown":
      return FirestoreFailure(message: tr.errorUnknown);
    default:
      return UnknownFailure.undefinedFirebase(message: firebaseException.code);
  }
}

Failure _handleCommonErrors(Object e) {
  if (e is TypeError) {
    return ParseFailure.typeFailure(stackTrace: e.stackTrace);
  }
  return UnknownFailure.undefined(message: e.toString());
}
