import 'package:carlog/generated/l10n.dart';
import 'package:formz/formz.dart';

class YearEntityValidator extends FormzInput<String, String> {
  const YearEntityValidator.pure([super.value = '']) : super.pure();
  const YearEntityValidator.dirty({String value = ''}) : super.dirty(value);

  @override
  String? validator(String value) {
    if (value.length != 4) {
      return S.current.carYearValidator;
    }
    return null;
  }
}
