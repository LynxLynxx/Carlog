import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_mode_cubit.freezed.dart';
part 'theme_mode_state.dart';

class ThemeModeCubit extends Cubit<ThemeModeState> {
  ThemeModeCubit() : super(const ThemeModeState(ThemeMode.dark));

  void changeTheme(ThemeMode newTheme) {
    emit(ThemeModeState(newTheme));
  }
}
