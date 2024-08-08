import 'dart:ui';

import 'package:carlog/generated/l10n.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:intl/intl.dart';

part 'language_cubit.freezed.dart';
part 'language_state.dart';

class LanguageCubit extends HydratedCubit<LanguageState> {
  final Intl localization;
  final S sInstance;
  LanguageCubit(this.localization, this.sInstance)
      : super(LanguageState(currentLocal: Locale(Intl.getCurrentLocale())));

  changeLanguage(String langCode) async {
    emit(_LanguageState(currentLocal: Locale(langCode)));
  }

  @override
  LanguageState? fromJson(Map<String, dynamic> json) {
    return LanguageState.fromMap(json);
  }

  @override
  Map<String, dynamic>? toJson(LanguageState state) {
    return state.toJson();
  }
}
