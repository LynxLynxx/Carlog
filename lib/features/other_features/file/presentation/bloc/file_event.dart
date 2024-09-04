part of 'file_bloc.dart';

@freezed
class FileEvent with _$FileEvent {
  const factory FileEvent.pickImage() = _PickImage;
  const factory FileEvent.clear() = _Clear;
}