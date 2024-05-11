import 'package:bloc/bloc.dart';
import 'package:carlog/core/extensions/dartz_extension.dart';
import 'package:carlog/features/auth_features/shared/repositories/auth_repository.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'google_auth_bloc.freezed.dart';
part 'google_auth_event.dart';
part 'google_auth_state.dart';

class GoogleAuthBloc extends Bloc<GoogleAuthEvent, GoogleAuthState> {
  final AuthRepository _authRepository;
  GoogleAuthBloc(this._authRepository) : super(const _GoogleAuthState()) {
    on<_FirebaseLogin>(_onFirebaseLogin);
  }

  _onFirebaseLogin(_FirebaseLogin event, Emitter<GoogleAuthState> emit) async {
    final result = await _authRepository.signInWithGoogle();

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
    emit(state.copyWith(status: FormzSubmissionStatus.success));
  }
}
