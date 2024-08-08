import 'package:carlog/generated/l10n.dart';
import 'package:flutter/material.dart';

List<SupportedLanguageEntity> supportedLanguages(
        BuildContext context, List<Locale> supportedLocales) =>
    List.generate(
      supportedLocales.length,
      (index) => SupportedLanguageEntity(
        languageCode: supportedLocales[index].languageCode,
        languageTranslation: S
            .of(context)
            .supportedLanguage(supportedLocales[index].languageCode),
      ),
    );

class SupportedLanguageEntity {
  final String languageCode;
  final String languageTranslation;

  SupportedLanguageEntity(
      {required this.languageCode, required this.languageTranslation});
}
