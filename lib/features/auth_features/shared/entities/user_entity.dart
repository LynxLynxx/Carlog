import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';
part 'user_entity.g.dart';

@freezed
class UserEntity with _$UserEntity {
  const UserEntity._();

  const factory UserEntity({
    required String id,
    String? email,
    String? name,
    String? photo,
    @Default("") String firstName,
    @Default("") String lastName,
  }) = _UserEntity;

  factory UserEntity.fromJson(Map<String, dynamic> json) =>
      _$UserEntityFromJson(json);

  /// Empty user which represents an unauthenticated user.
  static const unAuth = UserEntity(id: '');

  /// Convenience getter to determine whether the current user is empty.
  bool get isUnAuth => this == UserEntity.unAuth;

  /// Convenience getter to determine whether the current user is not empty.
  bool get isAuth => this != UserEntity.unAuth;
}
