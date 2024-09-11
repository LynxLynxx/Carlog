
import 'package:freezed_annotation/freezed_annotation.dart';

part 'password_entity.freezed.dart';
part 'password_entity.g.dart';

@freezed
class PasswordEntity with _$PasswordEntity {
  factory PasswordEntity({
    required String password,
  }) = _PasswordEntity;
	
  factory PasswordEntity.fromJson(Map<String, dynamic> json) =>
			_$PasswordEntityFromJson(json);
}
