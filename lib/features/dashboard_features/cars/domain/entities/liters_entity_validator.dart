import 'package:carlog/generated/l10n.dart';
import 'package:formz/formz.dart';

class LitersEntityValidator extends FormzInput<String, String> {
  const LitersEntityValidator.pure([super.value = '']) : super.pure();
  const LitersEntityValidator.dirty({String value = ''}) : super.dirty(value);

  @override
  String? validator(String value) {
    if ((value.isEmpty || value.length > 4) && value.isNotEmpty) {
      return S.current.litersValidator;
    }
    return null;
  }
}
