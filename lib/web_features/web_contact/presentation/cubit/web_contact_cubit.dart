// ignore_for_file: unused_field

import 'package:bloc/bloc.dart';
import 'package:carlog/core/error/failures.dart';
import 'package:carlog/core/extensions/dartz_extension.dart';
import 'package:carlog/web_features/web_contact/domain/entities/contact_entity.dart';
import 'package:carlog/web_features/web_contact/domain/usecases/send_email_usecase.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'web_contact_cubit.freezed.dart';
part 'web_contact_state.dart';

class WebContactCubit extends Cubit<WebContactState> {
  final SendEmailUsecase _sendEmailUsecase;
  WebContactCubit(this._sendEmailUsecase)
      : super(const WebContactState.initial());

  bool isActive(String newPassword, String rePassword) {
    if (newPassword == rePassword &&
        newPassword.isNotEmpty &&
        rePassword.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> sendMail(
      String sender, String email, String subject, String message) async {
    emit(const _Loading());

    final result = await _sendEmailUsecase(ContactEntity(
        sender: sender, email: email, subject: subject, message: message));

    if (result.isSome()) {
      emit(_Failure(result.asOption()));
      return;
    }

    emit(const _Data());
  }
}
