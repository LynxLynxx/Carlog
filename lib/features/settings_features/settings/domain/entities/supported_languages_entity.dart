import 'package:flutter/material.dart';

List<SupportedLanguageEntity> supportedLanguages(
        BuildContext context, List<Locale> supportedLocales) =>
    languages
        .where((language) =>
            supportedLocales.contains(Locale(language.languageCode)))
        .toList();

// List.generate(
//   supportedLocales.length,
//   (index) => SupportedLanguageEntity(
//     languageCode: supportedLocales[index].languageCode,
//     languageTranslation: S
//         .of(context)
//         .supportedLanguage(supportedLocales[index].languageCode),
//   ),
// );

class SupportedLanguageEntity {
  final String languageCode;
  final String languageTranslation;

  SupportedLanguageEntity(
      {required this.languageCode, required this.languageTranslation});
}

List<SupportedLanguageEntity> languages = [
  SupportedLanguageEntity(languageCode: 'aa', languageTranslation: 'Afar'),
  SupportedLanguageEntity(languageCode: 'ab', languageTranslation: 'Аҧсшәа'),
  SupportedLanguageEntity(languageCode: 'ae', languageTranslation: 'Avesta'),
  SupportedLanguageEntity(languageCode: 'af', languageTranslation: 'Afrikaans'),
  SupportedLanguageEntity(languageCode: 'ak', languageTranslation: 'Akan'),
  SupportedLanguageEntity(languageCode: 'am', languageTranslation: 'አማርኛ'),
  SupportedLanguageEntity(languageCode: 'an', languageTranslation: 'Aragonés'),
  SupportedLanguageEntity(languageCode: 'ar', languageTranslation: 'العربية'),
  SupportedLanguageEntity(languageCode: 'as', languageTranslation: 'অসমীয়া'),
  SupportedLanguageEntity(languageCode: 'av', languageTranslation: 'Авар'),
  SupportedLanguageEntity(languageCode: 'ay', languageTranslation: 'Aymara'),
  SupportedLanguageEntity(
      languageCode: 'az', languageTranslation: 'Azərbaycan dili'),
  SupportedLanguageEntity(languageCode: 'ba', languageTranslation: 'Башҡорт'),
  SupportedLanguageEntity(
      languageCode: 'be', languageTranslation: 'Беларуская'),
  SupportedLanguageEntity(languageCode: 'bg', languageTranslation: 'Български'),
  SupportedLanguageEntity(languageCode: 'bh', languageTranslation: 'भोजपुरी'),
  SupportedLanguageEntity(languageCode: 'bi', languageTranslation: 'Bislama'),
  SupportedLanguageEntity(
      languageCode: 'bm', languageTranslation: 'Bamanankan'),
  SupportedLanguageEntity(languageCode: 'bn', languageTranslation: 'বাংলা'),
  SupportedLanguageEntity(languageCode: 'bo', languageTranslation: 'བོད་ཡིག'),
  SupportedLanguageEntity(languageCode: 'br', languageTranslation: 'Brezhoneg'),
  SupportedLanguageEntity(languageCode: 'bs', languageTranslation: 'Bosanski'),
  SupportedLanguageEntity(languageCode: 'ca', languageTranslation: 'Català'),
  SupportedLanguageEntity(languageCode: 'ce', languageTranslation: 'Нохчийн'),
  SupportedLanguageEntity(languageCode: 'ch', languageTranslation: 'Chamorro'),
  SupportedLanguageEntity(languageCode: 'co', languageTranslation: 'Corsu'),
  SupportedLanguageEntity(languageCode: 'cr', languageTranslation: 'Cree'),
  SupportedLanguageEntity(languageCode: 'cs', languageTranslation: 'Čeština'),
  SupportedLanguageEntity(
      languageCode: 'cu', languageTranslation: 'Словѣньскъ'),
  SupportedLanguageEntity(languageCode: 'cv', languageTranslation: 'Чăваш'),
  SupportedLanguageEntity(languageCode: 'cy', languageTranslation: 'Cymraeg'),
  SupportedLanguageEntity(languageCode: 'da', languageTranslation: 'Dansk'),
  SupportedLanguageEntity(languageCode: 'de', languageTranslation: 'Deutsch'),
  SupportedLanguageEntity(languageCode: 'dv', languageTranslation: 'ދިވެހި'),
  SupportedLanguageEntity(languageCode: 'dz', languageTranslation: 'རྫོང་ཁ'),
  SupportedLanguageEntity(languageCode: 'ee', languageTranslation: 'Ewe'),
  SupportedLanguageEntity(languageCode: 'el', languageTranslation: 'Ελληνικά'),
  SupportedLanguageEntity(languageCode: 'en', languageTranslation: 'English'),
  SupportedLanguageEntity(languageCode: 'eo', languageTranslation: 'Esperanto'),
  SupportedLanguageEntity(languageCode: 'es', languageTranslation: 'Español'),
  SupportedLanguageEntity(
      languageCode: 'et', languageTranslation: 'Eesti keel'),
  SupportedLanguageEntity(languageCode: 'eu', languageTranslation: 'Euskara'),
  SupportedLanguageEntity(languageCode: 'fa', languageTranslation: 'فارسی'),
  SupportedLanguageEntity(languageCode: 'ff', languageTranslation: 'Fula'),
  SupportedLanguageEntity(languageCode: 'fi', languageTranslation: 'Suomi'),
  SupportedLanguageEntity(
      languageCode: 'fj', languageTranslation: 'Na Vosa Vakaviti'),
  SupportedLanguageEntity(languageCode: 'fo', languageTranslation: 'Føroyskt'),
  SupportedLanguageEntity(languageCode: 'fr', languageTranslation: 'Français'),
  SupportedLanguageEntity(languageCode: 'fy', languageTranslation: 'Frysk'),
  SupportedLanguageEntity(languageCode: 'ga', languageTranslation: 'Gaeilge'),
  SupportedLanguageEntity(languageCode: 'gd', languageTranslation: 'Gàidhlig'),
  SupportedLanguageEntity(languageCode: 'gl', languageTranslation: 'Galego'),
  SupportedLanguageEntity(languageCode: 'gn', languageTranslation: 'Añañe'),
  SupportedLanguageEntity(languageCode: 'gu', languageTranslation: 'ગુજરાતી'),
  SupportedLanguageEntity(languageCode: 'gv', languageTranslation: 'Gaelg'),
  SupportedLanguageEntity(languageCode: 'ha', languageTranslation: 'Hausa'),
  SupportedLanguageEntity(languageCode: 'he', languageTranslation: 'עברית'),
  SupportedLanguageEntity(languageCode: 'hi', languageTranslation: 'हिन्दी'),
  SupportedLanguageEntity(languageCode: 'ho', languageTranslation: 'Hiri Motu'),
  SupportedLanguageEntity(languageCode: 'hr', languageTranslation: 'Hrvatski'),
  SupportedLanguageEntity(
      languageCode: 'ht', languageTranslation: 'Kreyòl ayisyen'),
  SupportedLanguageEntity(languageCode: 'hu', languageTranslation: 'Magyar'),
  SupportedLanguageEntity(languageCode: 'hy', languageTranslation: 'Հայերեն'),
  SupportedLanguageEntity(languageCode: 'hz', languageTranslation: 'Herero'),
  SupportedLanguageEntity(
      languageCode: 'ia', languageTranslation: 'Interlingua'),
  SupportedLanguageEntity(
      languageCode: 'id', languageTranslation: 'Bahasa Indonesia'),
  SupportedLanguageEntity(
      languageCode: 'ie', languageTranslation: 'Interlingue'),
  SupportedLanguageEntity(languageCode: 'ig', languageTranslation: 'Igbo'),
  SupportedLanguageEntity(languageCode: 'ii', languageTranslation: '四川彝语'),
  SupportedLanguageEntity(languageCode: 'ik', languageTranslation: 'Iñupiatun'),
  SupportedLanguageEntity(languageCode: 'io', languageTranslation: 'Ido'),
  SupportedLanguageEntity(languageCode: 'is', languageTranslation: 'Íslenska'),
  SupportedLanguageEntity(languageCode: 'it', languageTranslation: 'Italiano'),
  SupportedLanguageEntity(languageCode: 'iu', languageTranslation: 'Inuktitut'),
  SupportedLanguageEntity(languageCode: 'ja', languageTranslation: '日本語'),
  SupportedLanguageEntity(languageCode: 'jv', languageTranslation: 'Basa Jawa'),
  SupportedLanguageEntity(languageCode: 'ka', languageTranslation: 'ქართული'),
  SupportedLanguageEntity(languageCode: 'kg', languageTranslation: 'Kikongo'),
  SupportedLanguageEntity(languageCode: 'ki', languageTranslation: 'Gikuyu'),
  SupportedLanguageEntity(languageCode: 'kj', languageTranslation: 'Kuanyama'),
  SupportedLanguageEntity(
      languageCode: 'kk', languageTranslation: 'Қазақ тілі'),
  SupportedLanguageEntity(
      languageCode: 'kl', languageTranslation: 'Kalaallisut'),
  SupportedLanguageEntity(languageCode: 'km', languageTranslation: 'ខ្មែរ'),
  SupportedLanguageEntity(languageCode: 'kn', languageTranslation: 'ಕನ್ನಡ'),
  SupportedLanguageEntity(languageCode: 'ko', languageTranslation: '한국어'),
  SupportedLanguageEntity(languageCode: 'kr', languageTranslation: 'Kanuri'),
  SupportedLanguageEntity(languageCode: 'ks', languageTranslation: 'कश्मीरी'),
  SupportedLanguageEntity(languageCode: 'ku', languageTranslation: 'Kurdî'),
  SupportedLanguageEntity(languageCode: 'kv', languageTranslation: 'Коми'),
  SupportedLanguageEntity(languageCode: 'kw', languageTranslation: 'Kernowek'),
  SupportedLanguageEntity(languageCode: 'ky', languageTranslation: 'Кыргызча'),
  SupportedLanguageEntity(languageCode: 'la', languageTranslation: 'Latina'),
  SupportedLanguageEntity(
      languageCode: 'lb', languageTranslation: 'Lëtzebuergesch'),
  SupportedLanguageEntity(languageCode: 'lg', languageTranslation: 'Luganda'),
  SupportedLanguageEntity(languageCode: 'li', languageTranslation: 'Limburgs'),
  SupportedLanguageEntity(languageCode: 'ln', languageTranslation: 'Lingála'),
  SupportedLanguageEntity(languageCode: 'lo', languageTranslation: 'ລາວ'),
  SupportedLanguageEntity(languageCode: 'lt', languageTranslation: 'Lietuvių'),
  SupportedLanguageEntity(
      languageCode: 'lu', languageTranslation: 'Luba-Katanga'),
  SupportedLanguageEntity(languageCode: 'lv', languageTranslation: 'Latviešu'),
  SupportedLanguageEntity(languageCode: 'mg', languageTranslation: 'Malagasy'),
  SupportedLanguageEntity(languageCode: 'mh', languageTranslation: 'M̧ajeļ'),
  SupportedLanguageEntity(languageCode: 'mi', languageTranslation: 'Māori'),
  SupportedLanguageEntity(
      languageCode: 'mk', languageTranslation: 'Македонски'),
  SupportedLanguageEntity(languageCode: 'ml', languageTranslation: 'മലയാളം'),
  SupportedLanguageEntity(languageCode: 'mn', languageTranslation: 'Монгол'),
  SupportedLanguageEntity(languageCode: 'mr', languageTranslation: 'मराठी'),
  SupportedLanguageEntity(
      languageCode: 'ms', languageTranslation: 'Bahasa Melayu'),
  SupportedLanguageEntity(languageCode: 'mt', languageTranslation: 'Malti'),
  SupportedLanguageEntity(languageCode: 'my', languageTranslation: 'မြန်မာ'),
  SupportedLanguageEntity(languageCode: 'na', languageTranslation: 'Nauruan'),
  SupportedLanguageEntity(
      languageCode: 'nb', languageTranslation: 'Norsk bokmål'),
  SupportedLanguageEntity(languageCode: 'nd', languageTranslation: 'Sindebele'),
  SupportedLanguageEntity(languageCode: 'ne', languageTranslation: 'नेपाली'),
  SupportedLanguageEntity(languageCode: 'ng', languageTranslation: 'Ndonga'),
  SupportedLanguageEntity(
      languageCode: 'nl', languageTranslation: 'Nederlands'),
  SupportedLanguageEntity(
      languageCode: 'nn', languageTranslation: 'Norsk nynorsk'),
  SupportedLanguageEntity(languageCode: 'no', languageTranslation: 'Norsk'),
  SupportedLanguageEntity(
      languageCode: 'nr', languageTranslation: 'Süd Ndebele'),
  SupportedLanguageEntity(
      languageCode: 'nv', languageTranslation: 'Diné bizaad'),
  SupportedLanguageEntity(languageCode: 'ny', languageTranslation: 'Chichewa'),
  SupportedLanguageEntity(languageCode: 'oc', languageTranslation: 'Occitan'),
  SupportedLanguageEntity(
      languageCode: 'oj', languageTranslation: 'ᓈᒃᑎᑐᑏᑯᓯᐋᓂᐧᐤ'),
  SupportedLanguageEntity(languageCode: 'om', languageTranslation: 'Oromoo'),
  SupportedLanguageEntity(languageCode: 'or', languageTranslation: 'ଓଡ଼ିଆ'),
  SupportedLanguageEntity(languageCode: 'os', languageTranslation: 'Ирон'),
  SupportedLanguageEntity(languageCode: 'pa', languageTranslation: 'ਪੰਜਾਬੀ'),
  SupportedLanguageEntity(languageCode: 'pi', languageTranslation: 'पालि'),
  SupportedLanguageEntity(languageCode: 'pl', languageTranslation: 'Polski'),
  SupportedLanguageEntity(languageCode: 'ps', languageTranslation: 'پښتو'),
  SupportedLanguageEntity(languageCode: 'pt', languageTranslation: 'Português'),
  SupportedLanguageEntity(languageCode: 'qu', languageTranslation: 'Quechua'),
  SupportedLanguageEntity(languageCode: 'rm', languageTranslation: 'Rumantsch'),
  SupportedLanguageEntity(languageCode: 'rn', languageTranslation: 'Kirundi'),
  SupportedLanguageEntity(languageCode: 'ro', languageTranslation: 'Română'),
  SupportedLanguageEntity(languageCode: 'ru', languageTranslation: 'Русский'),
  SupportedLanguageEntity(
      languageCode: 'rw', languageTranslation: 'Ikinyarwanda'),
  SupportedLanguageEntity(languageCode: 'sa', languageTranslation: 'संस्कृतम्'),
  SupportedLanguageEntity(languageCode: 'sc', languageTranslation: 'Sardu'),
  SupportedLanguageEntity(languageCode: 'sd', languageTranslation: 'سنڌي'),
  SupportedLanguageEntity(
      languageCode: 'se', languageTranslation: 'Davvisámegiella'),
  SupportedLanguageEntity(languageCode: 'sg', languageTranslation: 'Sango'),
  SupportedLanguageEntity(languageCode: 'si', languageTranslation: 'සිංහල'),
  SupportedLanguageEntity(
      languageCode: 'sk', languageTranslation: 'Slovenčina'),
  SupportedLanguageEntity(
      languageCode: 'sl', languageTranslation: 'Slovenščina'),
  SupportedLanguageEntity(
      languageCode: 'sm', languageTranslation: 'Gagana Samoa'),
  // More languages can be added here...
];
