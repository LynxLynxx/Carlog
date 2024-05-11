import 'package:bloc/bloc.dart';
import 'package:carlog/core/extensions/dartz_extension.dart';
import 'package:carlog/features/auth_features/shared/repositories/auth_repository.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'firebase_auth_bloc.freezed.dart';
part 'firebase_auth_event.dart';
part 'firebase_auth_state.dart';

class FirebaseAuthBloc extends Bloc<FirebaseAuthEvent, FirebaseAuthState> {
  final AuthRepository _authRepository;
  FirebaseAuthBloc(this._authRepository) : super(const _FirebaseAuthState()) {
    on<_GoogleSignIn>(_onGoogleSignIn);
    on<_FacebookSignIn>(_onFacebookSignIn);
  }

  _onGoogleSignIn(_GoogleSignIn event, Emitter<FirebaseAuthState> emit) async {
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

  _onFacebookSignIn(
      _FacebookSignIn event, Emitter<FirebaseAuthState> emit) async {
    final result = await _authRepository.signInWithFacebook();

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
