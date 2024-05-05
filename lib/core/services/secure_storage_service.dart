import 'dart:convert';

import 'package:carlog/features/auth_features/shared/entities/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:injectable/injectable.dart';

class SecureK {
  static const currentUser = "current_user";
}

class SecureItem extends Equatable {
  final String key; // take keys from constants
  final String value;

  const SecureItem(this.key, this.value);

  @override
  List<Object?> get props => [key, value];
}

@LazySingleton()
class SecureStorageService {
  final _secureStorage = const FlutterSecureStorage(
      aOptions: AndroidOptions(
    encryptedSharedPreferences: true,
  ));

  Future<Option<dynamic>> writeSecureData(SecureItem item) async {
    try {
      await _secureStorage.write(key: item.key, value: item.value);
      return none();
    } catch (e) {
      return some(Exception());
    }
  }

  Future<String?> readSecureData(String key) async {
    final result = await _secureStorage.read(key: key);
    return result;
  }

  writeCurrentUser(UserEntity userEntity) async {
    await writeSecureData(
        SecureItem(SecureK.currentUser, json.encode(userEntity.toJson())));
  }

  Future<UserEntity?> readCurrentUser() async {
    final currentUserString = await readSecureData(SecureK.currentUser);
    if (currentUserString == null) {
      return null;
    }
    final currentUser = json.decode(currentUserString);
    return UserEntity.fromJson(currentUser);
  }
}
