import 'package:bloc/bloc.dart';
import 'package:carlog/core/error/failures.dart';
import 'package:carlog/core/extensions/dartz_extension.dart';
import 'package:carlog/features/settings_features/change_password/domain/usecases/reauthenticate_user_usecase.dart';
import 'package:carlog/features/settings_features/delete_account/domain/usecases/delete_account_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_account_cubit.freezed.dart';
part 'delete_account_state.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  final ReauthenticateUserUsecase _reauthenticateUserUsecase;
  final DeleteAccountUsecase _deleteAccountUsecase;

  DeleteAccountCubit(
      this._reauthenticateUserUsecase, this._deleteAccountUsecase)
      : super(const DeleteAccountState.initial());

  bool isActive(String newPassword, String rePassword) {
    if (newPassword == rePassword &&
        newPassword.isNotEmpty &&
        rePassword.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  enterPassword() {
    emit(const _Data());
  }

  Future<void> deleteAccount(String password) async {
    emit(const _Loading());

    final reAuthResult = await _reauthenticateUserUsecase.call(password);

    if (reAuthResult.isSome()) {
      emit(_Failure(reAuthResult.asOption()));
      return emit(const _Data());
    }

    final deleteAccountResult = await _deleteAccountUsecase.call();

    if (deleteAccountResult.isSome()) {
      emit(_Failure(deleteAccountResult.asOption()));
      return emit(const _Data());
    }
    emit(const _Data());
    emit(const _Initial());
  }
}
