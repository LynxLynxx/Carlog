import 'package:carlog/generated/l10n.dart';
import 'package:formz/formz.dart';

class ModelEntityValidator extends FormzInput<String, String> {
  const ModelEntityValidator.pure([super.value = '']) : super.pure();
  const ModelEntityValidator.dirty({String value = ''}) : super.dirty(value);

  @override
  String? validator(String value) {
    if ((value.length < 2 || value.length > 30) && value.isNotEmpty) {
      return S.current.carModelValidator;
    }
    return null;
  }
}