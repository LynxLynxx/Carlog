import 'package:carlog/generated/l10n.dart';
import 'package:formz/formz.dart';

class MailFormz extends FormzInput<String, String> {
  const MailFormz.pure([super.value = '']) : super.pure();
  const MailFormz.dirty({String value = ''}) : super.dirty(value);

  @override
  String? validator(String value) {
    final emailRegExp =
        RegExp(r'^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$');
    if (!emailRegExp.hasMatch(value) && value.isNotEmpty) {
      return S.current.mailValidator;
    } else if (value.isEmpty) {
      return S.current.notValidEmpty;
    }
    return null;
  }
}
