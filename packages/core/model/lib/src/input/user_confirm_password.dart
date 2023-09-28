import 'package:formz/formz.dart';

enum UserConfirmPasswordError { empty, mismatch }

class UserConfirmPassword extends FormzInput<String, UserConfirmPasswordError> {
  final String passwordToCompare;

  UserConfirmPassword.pure({
    this.passwordToCompare = '',
    String value = '',
  }) : super.pure(value);

  UserConfirmPassword.dirty({
    required this.passwordToCompare,
    required String value,
  }) : super.dirty(value);

  @override
  UserConfirmPasswordError? validator(String value) {
    if (value.isEmpty) return UserConfirmPasswordError.empty;
    if (value != passwordToCompare) return UserConfirmPasswordError.mismatch;
    return null;
  }
}
