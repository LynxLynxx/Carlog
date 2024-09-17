import 'package:bloc/bloc.dart';
import 'package:carlog/core/extensions/dartz_extension.dart';
import 'package:carlog/features/auth_features/register/domain/entities/mail_formz.dart';
import 'package:carlog/features/auth_features/register/domain/entities/mail_password_form.dart';
import 'package:carlog/features/auth_features/register/domain/entities/name_formz.dart';
import 'package:carlog/features/auth_features/shared/repositories/auth_repository.dart';
import 'package:formz/formz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'mail_register_bloc.freezed.dart';
part 'mail_register_event.dart';
part 'mail_register_state.dart';

class MailRegisterBloc extends Bloc<MailRegisterEvent, MailRegisterState> {
  final AuthRepository _authRepository;
  MailRegisterBloc(this._authRepository) : super(const _MailRegisterState()) {
    on<_NameChange>(_onNameChange);
    on<_EmailChange>(_onEmailChange);
    on<_PasswordChange>(_onPasswordChange);
    on<_Submit>(_onSubmit);
  }

  void _onNameChange(_NameChange event, Emitter<MailRegisterState> emit) {
    final name = NameFormz.pure(event.value);
    emit(
      state.copyWith(name: name),
    );
  }

  void _onEmailChange(_EmailChange event, Emitter<MailRegisterState> emit) {
    final mail = MailFormz.pure(event.value);
    emit(
      state.copyWith(mail: mail),
    );
  }

  void _onPasswordChange(
      _PasswordChange event, Emitter<MailRegisterState> emit) {
    final password = PasswordMailEntity.pure(event.value);
    emit(
      state.copyWith(password: password),
    );
  }

  Future<void> _onSubmit(_Submit event, Emitter<MailRegisterState> emit) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    final name = NameFormz.dirty(value: state.name.value);
    final mail = MailFormz.dirty(value: state.mail.value);
    final password = PasswordMailEntity.dirty(state.password.value);
    if (!Formz.validate([name, mail, password])) {
      return emit(state.copyWith(
          name: name, mail: mail, password: password, errorMessage: null));
    }
    final result = await _authRepository.signUp(
        name: state.name.value,
        email: state.mail.value,
        password: state.password.value);

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
