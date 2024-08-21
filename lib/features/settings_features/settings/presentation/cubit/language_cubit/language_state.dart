part of 'language_cubit.dart';

@freezed
class LanguageState with _$LanguageState {
  const factory LanguageState({required Locale currentLocal}) = _LanguageState;

  const LanguageState._();

  factory LanguageState.fromMap(Map<String, dynamic> json) {
    return LanguageState(currentLocal: Locale(json["langCode"] ?? "en_US"));
  }

  Map<String, dynamic> toJson() {
    return {"langCode": currentLocal.languageCode};
  }
}
