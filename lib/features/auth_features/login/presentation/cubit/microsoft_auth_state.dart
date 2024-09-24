part of 'microsoft_auth_cubit.dart';

@freezed
class MicrosoftAuthState with _$MicrosoftAuthState {
  const factory MicrosoftAuthState.initial() = _Initial;
  const factory MicrosoftAuthState.loading() = _Loading;
  const factory MicrosoftAuthState.success() = _Success;
  const factory MicrosoftAuthState.error(Failure errorMessage) = _Error;
}
