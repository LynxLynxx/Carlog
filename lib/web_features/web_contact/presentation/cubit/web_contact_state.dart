part of 'web_contact_cubit.dart';

@freezed
class WebContactState with _$WebContactState {
  const factory WebContactState.initial() = _Initial;
  const factory WebContactState.loading() = _Loading;
  const factory WebContactState.data() = _Data;
  const factory WebContactState.failure(final Failure failure) = _Failure;
}
