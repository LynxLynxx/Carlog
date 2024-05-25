import 'package:carlog/generated/l10n.dart';
import 'package:formz/formz.dart';

class BrandEntityValidator extends FormzInput<String, String> {
  const BrandEntityValidator.pure([super.value = '']) : super.pure();
  const BrandEntityValidator.dirty({String value = ''}) : super.dirty(value);

  @override
  String? validator(String value) {
    if ((value.length < 2 || value.length > 20) && value.isNotEmpty) {
      return S.current.carBrandValidator;
    }
    return null;
  }
}
