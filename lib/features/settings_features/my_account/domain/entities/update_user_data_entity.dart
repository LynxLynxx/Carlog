import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_user_data_entity.freezed.dart';
part 'update_user_data_entity.g.dart';

@freezed
class UpdateUserDataEntity with _$UpdateUserDataEntity {
  factory UpdateUserDataEntity({
    required final String firstName,
    required final String lastName,
  }) = _UpdateUserDataEntity;

  factory UpdateUserDataEntity.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserDataEntityFromJson(json);
}
