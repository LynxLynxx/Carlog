import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'tutorial_index_event.dart';
part 'tutorial_index_state.dart';
part 'tutorial_index_bloc.freezed.dart';

class TutorialIndexBloc extends Bloc<TutorialIndexEvent, TutorialIndexState> {
  TutorialIndexBloc() : super(const _TutorialIndex()) {
    on<_ChangeIndex>(_onChangeIndex);
  }

  void _onChangeIndex(_ChangeIndex event, Emitter<TutorialIndexState> emit) {
    emit(state.copyWith(index: event.index));
  }
}
