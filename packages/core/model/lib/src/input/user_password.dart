import 'package:formz/formz.dart';

enum UserPasswordError { empty, invalid }

class UserPassword extends FormzInput<String, UserPasswordError> {
  UserPassword.pure([super.value = '']) : super.pure();

  UserPassword.dirty([super.value = '']) : super.dirty();

  static final _regexExp = RegExp(
    r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$',
  );

  late final validationResultCache =
      _regexExp.hasMatch(value) ? null : UserPasswordError.invalid;

  @override
  UserPasswordError? validator(String value) {
    if (value.isEmpty) return UserPasswordError.empty;
    return validationResultCache;
  }
}
