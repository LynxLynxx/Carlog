import 'package:carlog/generated/l10n.dart';
import 'package:formz/formz.dart';

class MilageEntityValidator extends FormzInput<String, String> {
  const MilageEntityValidator.pure([super.value = '']) : super.pure();
  const MilageEntityValidator.dirty({String value = ''}) : super.dirty(value);

  @override
  String? validator(String value) {
    if ((value.isEmpty || value.length > 8) && value.isNotEmpty) {
      return S.current.milageValidator;
    }
    return null;
  }
}
