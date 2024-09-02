import 'dart:io';

import 'package:carlog/core/error/handle_exception.dart';
import 'package:firebase_storage/firebase_storage.dart';

abstract class FileDatasource {
  Future<String> uploadFile(File file);
}

class FileDatasourceImpl implements FileDatasource {
  final FirebaseStorage _firebaseStorage;

  FileDatasourceImpl() : _firebaseStorage = FirebaseStorage.instance;

  @override
  Future<String> uploadFile(File file) async {
    return await handleFirebaseStorage(
        _firebaseStorage.ref().child('files/${file.path.split('/').last}'),
        (ref) async {
      String link;
      UploadTask uploadTask = ref.putFile(file);
      TaskSnapshot snapshot = await uploadTask;
      link = await snapshot.ref.getDownloadURL();

      return link;
    });
  }
}
