import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:carlog/main.dart';
import 'package:equatable/equatable.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit() : super(ChangePasswordInitial()) {
    _initState();
  }

  _initState() async {
    var string = await getCannyToken();
    log(string);
  }
}
