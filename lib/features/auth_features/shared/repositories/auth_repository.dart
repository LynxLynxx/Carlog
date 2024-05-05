import 'package:carlog/core/error/failures.dart';
import 'package:carlog/core/error/handle_exception.dart';
import 'package:carlog/core/services/secure_storage_service.dart';
import 'package:carlog/features/auth_features/shared/entities/user_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

@LazySingleton()
class AuthRepository {
  final SecureStorageService secureStorageService;
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;

  AuthRepository({
    required this.secureStorageService,
  })  : _firebaseAuth = FirebaseAuth.instance,
        _googleSignIn = GoogleSignIn.standard();

  Stream<UserEntity> get user {
    return _firebaseAuth.authStateChanges().map((firebaseUser) {
      final UserEntity user =
          firebaseUser == null ? UserEntity.unAuth : firebaseUser.toUserEntity;
      secureStorageService.writeCurrentUser(user);
      return user;
    });
  }

  Future<UserEntity> get currentUser async {
    // return _secureStorage§
    return await secureStorageService.readCurrentUser() ?? UserEntity.unAuth;
  }

  Future<Option<Failure>> signUp(
      {required String email, required String password}) async {
    return handleVoidResponse(
      () async => await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      ),
    );
  }

  Future<Option<Failure>> createUserDocument() async {
    return handleVoidResponse(() async {
      // final User? user = FirebaseAuth.instance.currentUser;
      final currentUser = await this.currentUser;
      // Check if user is logged in
      if (currentUser.isUnAuth) {
        throw FirebaseAuthException(code: "user-not-found");
      }

      // Create a new document in the users collection with the user's ID
      final CollectionReference usersRef =
          FirebaseFirestore.instance.collection('users');
      final DocumentReference userDocRef = usersRef.doc(currentUser.id);

      // Prepare user data (replace with your actual data structure)
      final userData = {
        'userId': currentUser.id,
        'email': currentUser.email, // Optional, if you want to store it
        // 'username': username,
        'profilePictureUrl': '', // Placeholder, can be updated later
        'plan': "free",
        'role': 'regular_user', // Set initial role (adjust based on your needs)
      };

      // Set the user data in the Firestore document
      await userDocRef.set(userData);
    });
  }

  logOut() {
    handleVoidResponse(() async => await Future.wait(
          [
            _firebaseAuth.signOut(),
            _googleSignIn.signOut(),
          ],
        ));
  }
}

extension on User {
  UserEntity get toUserEntity => UserEntity(
        id: uid,
        email: email,
        name: displayName,
        photo: photoURL,
      );
}
