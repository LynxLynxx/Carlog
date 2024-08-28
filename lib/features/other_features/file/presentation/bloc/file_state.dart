part of 'file_bloc.dart';

@freezed
class FileState with _$FileState {
  const factory FileState.initial() = _Initial;
  const factory FileState.loading() = _Loading;
  const factory FileState.data(final File file) = _Data;
  const factory FileState.failure(final Failure failure) = _Failure;
}
