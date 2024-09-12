// ignore_for_file: unused_field

import 'package:bloc/bloc.dart';
import 'package:carlog/core/error/failures.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'web_contact_cubit.freezed.dart';
part 'web_contact_state.dart';

class WebContactCubit extends Cubit<WebContactState> {
  WebContactCubit() : super(const WebContactState.initial());

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

    return;
  }
}
