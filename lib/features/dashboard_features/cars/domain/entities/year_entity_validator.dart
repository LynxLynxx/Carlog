import 'package:carlog/generated/l10n.dart';
import 'package:formz/formz.dart';

class YearEntityValidator extends FormzInput<String, String> {
  const YearEntityValidator.pure() : super.pure('');
  const YearEntityValidator.dirty([super.value = '']) : super.dirty();

  @override
  String? validator(String value) {
    if (value.isEmpty || value.length <= 15) {
      return S.current.carYearValidator;
    }
    return null;
  }
}
