
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_entity.freezed.dart';
part 'contact_entity.g.dart';

@freezed
class ContactEntity with _$ContactEntity {
  factory ContactEntity({
    required String email,
    required String sender,
    required String subject,
    required String message,
  }) = _ContactEntity;
	
  factory ContactEntity.fromJson(Map<String, dynamic> json) =>
			_$ContactEntityFromJson(json);
}
