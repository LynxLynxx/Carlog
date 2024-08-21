import 'package:carlog/core/constants/collections.dart';
import 'package:carlog/core/error/handle_exception.dart';
import 'package:carlog/features/settings_features/my_account/domain/entities/update_user_data_entity.dart';
import 'package:carlog/features/settings_features/my_account/domain/entities/user_data_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserDataDatasource {
  Future<UserDataEntity> getUserData();
  Future<void> updateUserData(UpdateUserDataEntity userData);
}

class UserDataDatasourceImpl implements UserDataDatasource {
  final FirebaseFirestore _firebaseFirestore;

  UserDataDatasourceImpl() : _firebaseFirestore = FirebaseFirestore.instance;
  @override
  Future<UserDataEntity> getUserData() async => await handleFirestoreDocData(
      _firebaseFirestore
          .collection(CollectionsK.users)
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .path,
      (doc) => UserDataEntity.fromJson(doc));

  @override
  Future<void> updateUserData(UpdateUserDataEntity userData) async {
    return await handleFirestoreDoc(
      _firebaseFirestore
          .collection(CollectionsK.users)
          .doc(FirebaseAuth.instance.currentUser?.uid),
      (doc) => doc.update(userData.toJson()),
    );
  }
}
