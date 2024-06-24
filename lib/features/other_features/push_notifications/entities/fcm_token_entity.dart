import 'package:freezed_annotation/freezed_annotation.dart';

part 'fcm_token_entity.freezed.dart';
part 'fcm_token_entity.g.dart';

@freezed
class FcmTokenEntity with _$FcmTokenEntity {
  factory FcmTokenEntity({
    required final String apptype,
    required final String token,
  }) = _FcmTokenEntity;

  factory FcmTokenEntity.fromJson(Map<String, dynamic> json) =>
      _$FcmTokenEntityFromJson(json);
}
