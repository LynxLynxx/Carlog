import 'package:formz/formz.dart';

class CarTypeEntityValidator extends FormzInput<String, String> {
  const CarTypeEntityValidator.pure([super.value = '']) : super.pure();
  const CarTypeEntityValidator.dirty({String value = ''}) : super.dirty(value);

  @override
  String? validator(String value) {
    if ((value.length < 2 || value.length > 15) && value.isNotEmpty) {
      return 'The car type should be between 2 and 15 characters';
    }
    return null;
  }
}
