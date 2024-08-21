import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_data_entity.freezed.dart';
part 'user_data_entity.g.dart';

@freezed
class UserDataEntity with _$UserDataEntity {
  factory UserDataEntity(
    final String firstName,
    final String lastName,
    final String email,
  ) = _UserDataEntity;

  factory UserDataEntity.fromJson(Map<String, dynamic> json) =>
      _$UserDataEntityFromJson(json);
}
