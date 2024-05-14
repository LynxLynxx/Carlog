import 'package:bloc/bloc.dart';
import 'package:carlog/core/extensions/dartz_extension.dart';
import 'package:carlog/features/auth_features/register/domain/entities/mail_formz.dart';
import 'package:carlog/features/auth_features/register/domain/entities/mail_password_form.dart';
import 'package:carlog/features/auth_features/shared/repositories/auth_repository.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mail_login_bloc.freezed.dart';
part 'mail_login_event.dart';
part 'mail_login_state.dart';

class MailLoginBloc extends Bloc<MailLoginEvent, MailLoginState> {
  final AuthRepository _authRepository;
  MailLoginBloc(this._authRepository) : super(const _MailLoginState()) {
    on<_EmailChange>(_onEmailChange);
    on<_PasswordChange>(_onPasswordChange);
    on<_Submit>(_onSubmit);
  }

  void _onEmailChange(_EmailChange event, Emitter<MailLoginState> emit) {
    final mail = MailFormz.pure(event.value);
    emit(
      state.copyWith(mail: mail),
    );
  }

  void _onPasswordChange(_PasswordChange event, Emitter<MailLoginState> emit) {
    final password = PasswordMailEntity.pure(event.value);
    emit(
      state.copyWith(password: password),
    );
  }

  Future<void> _onSubmit(_Submit event, Emitter<MailLoginState> emit) async {
    final mail = MailFormz.dirty(value: state.mail.value);
    final password = PasswordMailEntity.dirty(state.password.value);
    if (!Formz.validate([mail, password])) {
      return emit(
          state.copyWith(mail: mail, password: password, errorMessage: null));
    }

    final result = await _authRepository.signIn(
        email: state.mail.value, password: state.password.value);

    if (result.isSome()) {
      return emit(state.copyWith(
          status: FormzSubmissionStatus.failure,
          errorMessage: result.asOption().message));
    }
    // emit(state.copyWith(
    //     status: FormzSubmissionStatus.inProgress, errorMessage: null));
    emit(state.copyWith(status: FormzSubmissionStatus.success));
  }
}
