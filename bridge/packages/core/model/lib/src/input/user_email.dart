import 'package:formz/formz.dart';

enum UserEmailError { empty, invalid }

class UserEmail extends FormzInput<String, UserEmailError> {
  UserEmail.pure([super.value = '']) : super.pure();

  UserEmail.dirty([super.value = '']) : super.dirty();

  static final _regexExp = RegExp(
    r'^[a-zA-Z0-9.!#$%&’*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$',
  );

  late final validationResultCache = _regexExp.hasMatch(value) ? null : UserEmailError.invalid;

  @override
  UserEmailError? validator(String value) {
    if (value.isEmpty) return UserEmailError.empty;
    return validationResultCache;
  }
}
