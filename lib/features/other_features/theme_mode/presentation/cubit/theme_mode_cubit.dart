import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

part 'theme_mode_cubit.freezed.dart';
part 'theme_mode_state.dart';

class ThemeModeCubit extends HydratedCubit<ThemeModeState> {
  ThemeModeCubit() : super(const ThemeModeState(ThemeMode.dark));

  void changeTheme(ThemeMode newTheme) {
    emit(ThemeModeState(newTheme));
  }

  @override
  ThemeModeState? fromJson(Map<String, dynamic> json) =>
      ThemeModeState.fromJson(json);
  @override
  Map<String, dynamic>? toJson(ThemeModeState state) => state.toJson();
}
