import 'package:formz/formz.dart';

enum UserNicknameError { empty, minLength, maxLength, restrictedCharacters }

class UserNickname extends FormzInput<String, UserNicknameError> {
  UserNickname.pure([super.value = '']) : super.pure();

  UserNickname.dirty([super.value = '']) : super.dirty();

  static final _regexExp = RegExp(r'^\w+$');

  late final validationResultCache =
      _regexExp.hasMatch(value) ? null : UserNicknameError.restrictedCharacters;

  @override
  UserNicknameError? validator(String value) {
    if (value.isEmpty) return UserNicknameError.empty;
    if (value.length < 3) return UserNicknameError.minLength;
    if (value.length > 15) return UserNicknameError.maxLength;
    return validationResultCache;
  }
}
