import 'package:carlog/generated/l10n.dart';
import 'package:formz/formz.dart';

class NameFormz extends FormzInput<String, String> {
  const NameFormz.pure([super.value = '']) : super.pure();
  const NameFormz.dirty({String value = ''}) : super.dirty(value);

  @override
  String? validator(String value) {
  
    if (value.length > 30) {
      return S.current.nameValidator;
    } else if (value.isEmpty) {
      return S.current.notValidEmpty;
    }
    return null;
  }
}
