// ignore_for_file: unused_field

import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:carlog/core/error/failures.dart';
import 'package:carlog/core/extensions/dartz_extension.dart';
import 'package:carlog/features/settings_features/change_password/domain/usecases/change_password_usecase.dart';
import 'package:carlog/features/settings_features/change_password/domain/usecases/reauthenticate_user_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'change_password_cubit.freezed.dart';
part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  final ReauthenticateUserUsecase _reauthenticateUserUsecase;
  final ChangePasswordUsecase _changePasswordUsecase;

  ChangePasswordCubit(
      this._reauthenticateUserUsecase, this._changePasswordUsecase)
      : super(const ChangePasswordState.initial());

  bool isActive(String newPassword, String rePassword) {
    if (newPassword == rePassword &&
        newPassword.isNotEmpty &&
        rePassword.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> changePassword(
      String oldPassword, String newPassword, String rePassword) async {
    emit(const _Loading());

    final reAuthResult = await _reauthenticateUserUsecase.call(oldPassword);

    if (reAuthResult.isSome()) {
      emit(_Failure(reAuthResult.asOption()));
      return emit(const _Initial());
    }

    final changePasswordResult = await _changePasswordUsecase.call(newPassword);

    if (changePasswordResult.isSome()) {
      emit(_Failure(changePasswordResult.asOption()));
    }
    emit(const _Data());
    emit(const _Initial());
  }
}
