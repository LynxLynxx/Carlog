import 'package:formz/formz.dart';

class PasswordMailEntity extends FormzInput<String, String> {
  const PasswordMailEntity.pure([super.value = '']) : super.pure();
  const PasswordMailEntity.dirty([super.value = '']) : super.dirty();

  @override
  validator(String value) {
    final passwordRegExp = RegExp(
        r"^(?=.*[A-Z])(?=.*[a-z])(?=.*[!@#$%^&*()_+-=\|/?.,><;:\[\]{}])[A-Za-z0-9!@#$%^&*()_+-=\|/?.,><;:\[\]{}]{8,}$");
    // final passwordRegExp = RegExp(r"^[0-9a-zA-Z@$!%*?&]{6,}$");
    if (!passwordRegExp.hasMatch(value) && value.isNotEmpty) {
      return "Hasło musi zawierać min jednek znak specjalny, duża i mała litere. Hasło musi składać się z minimum 8 znaków. Znaki niedozwolone: \" '";
    } else if (value.isEmpty) {
      return "Wprowadź hasło";
    }

    return null;
  }
}
