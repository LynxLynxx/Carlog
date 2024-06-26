import 'package:bloc/bloc.dart';
import 'package:carlog/core/services/secure_storage_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'tutorial_bloc.freezed.dart';
part 'tutorial_event.dart';
part 'tutorial_state.dart';

@Singleton()
class TutorialBloc extends Bloc<TutorialEvent, TutorialState> {
  final SecureStorageService secureStorageService;

  TutorialBloc(this.secureStorageService) : super(const _TutorialState()) {
    on<_WriteFirstEntryToApp>(_onWriteFirstEntryToApp);
    on<_ReadFirstEntryToApp>(_onReadFirstEntryToApp);
    on<_ResetFirstEntryToApp>(_onResetFirstEntryToApp);
  }

  void _onWriteFirstEntryToApp(
      _WriteFirstEntryToApp event, Emitter<TutorialState> emit) async {
    await secureStorageService.writeFirstEntryToApp();
    add(const TutorialEvent.readFirstEntryToApp());
  }

  void _onReadFirstEntryToApp(
      _ReadFirstEntryToApp event, Emitter<TutorialState> emit) async {
    final result = await secureStorageService.readFirstEntryToApp();
    emit(state.copyWith(
        tutorialStatus: result == true
            ? TutorialStatus.firstEntry
            : TutorialStatus.nextEntry));
  }

  void _onResetFirstEntryToApp(
      _ResetFirstEntryToApp event, Emitter<TutorialState> emit) async {
    await secureStorageService.resetFirstEntryToApp();
    add(const TutorialEvent.readFirstEntryToApp());
  }
}
