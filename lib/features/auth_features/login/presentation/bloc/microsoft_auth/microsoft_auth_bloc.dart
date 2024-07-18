import 'package:bloc/bloc.dart';
import 'package:carlog/core/extensions/dartz_extension.dart';
import 'package:carlog/features/auth_features/shared/repositories/auth_repository.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'microsoft_auth_bloc.freezed.dart';
part 'microsoft_auth_event.dart';
part 'microsoft_auth_state.dart';

class MicrosoftAuthBloc extends Bloc<MicrosoftAuthEvent, MicrosoftAuthState> {
  final AuthRepository _authRepository;
  MicrosoftAuthBloc(this._authRepository) : super(const _MicrosoftAuthState()) {
    on<_FirebaseLogin>(_onFirebaseLogin);
  }

  _onFirebaseLogin(
      _FirebaseLogin event, Emitter<MicrosoftAuthState> emit) async {
    final result = await _authRepository.signInWithMicrosoft();

    if (result.isSome()) {
      return emit(state.copyWith(
          status: FormzSubmissionStatus.failure,
          errorMessage: result.asOption().message));
    }
    final createUserDoc = await _authRepository.createUserDocument();

    createUserDoc.fold(
      () => emit(state.copyWith(status: FormzSubmissionStatus.success)),
      (a) {
        emit(state.copyWith(
            status: FormzSubmissionStatus.failure,
            errorMessage: createUserDoc.asOption().message));
      },
    );
  }
}
