import 'package:formz/formz.dart';

class FuelTypeEntityValidator extends FormzInput<String, String> {
  const FuelTypeEntityValidator.pure([super.value = '']) : super.pure();
  const FuelTypeEntityValidator.dirty({String value = ''}) : super.dirty(value);

  @override
  String? validator(String value) {
    if ((value.length < 2 || value.length > 15) && value.isNotEmpty) {
      return 'The fuel type should be between 2 and 15 characters';
    }
    return null;
  }
}
