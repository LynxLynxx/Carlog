import 'package:bloc/bloc.dart';
import 'package:carlog/core/extensions/dartz_extension.dart';
import 'package:carlog/features/auth_features/register/domain/entities/mail_formz.dart';
import 'package:carlog/features/auth_features/shared/repositories/auth_repository.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'reset_password_bloc.freezed.dart';
part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final AuthRepository _authRepository;
  ResetPasswordBloc(this._authRepository) : super(const _ResetPasswordState()) {
    on<_EmailChange>(_onEmailChange);
    on<_Submit>(_onSubmit);
  }

  void _onEmailChange(_EmailChange event, Emitter<ResetPasswordState> emit) {
    final mail = MailFormz.pure(event.value);
    emit(
      state.copyWith(mail: mail),
    );
  }

  Future<void> _onSubmit(
      _Submit event, Emitter<ResetPasswordState> emit) async {
    final mail = MailFormz.dirty(value: state.mail.value);
    if (!Formz.validate([mail])) {
      return emit(state.copyWith(mail: mail, errorMessage: null));
    }

    final result = await _authRepository.resetPassword(email: state.mail.value);

    if (result.isSome()) {
      return emit(state.copyWith(
          status: FormzSubmissionStatus.failure,
          errorMessage: result.asOption().message));
    }
    emit(state.copyWith(
        status: FormzSubmissionStatus.inProgress, errorMessage: null));
    emit(state.copyWith(status: FormzSubmissionStatus.success));
  }
}
