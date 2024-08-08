part of 'theme_mode_cubit.dart';

@freezed
class ThemeModeState with _$ThemeModeState {
  const factory ThemeModeState(ThemeMode themeMode) = _ThemeModeState;

  const ThemeModeState._();

  factory ThemeModeState.fromJson(Map<String, dynamic> json) {
    return ThemeModeState(json["theme"] == ThemeMode.dark.name
        ? ThemeMode.dark
        : ThemeMode.light);
  }

  Map<String, dynamic> toJson() {
    return {"theme": themeMode.name};
  }
}
