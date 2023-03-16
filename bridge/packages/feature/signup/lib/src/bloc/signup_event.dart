part of 'signup_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class ObscurePassword extends SignUpEvent {
  const ObscurePassword();
}

class ObscureConfirmPassword extends SignUpEvent {
  const ObscureConfirmPassword();
}

class EmailChange extends SignUpEvent {
  const EmailChange(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class PasswordChange extends SignUpEvent {
  const PasswordChange(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class ConfirmPasswordChange extends SignUpEvent {
  const ConfirmPasswordChange(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class NicknameChange extends SignUpEvent {
  const NicknameChange(this.nickname);

  final String nickname;

  @override
  List<Object> get props => [nickname];
}

class SubmitForm extends SignUpEvent {
  const SubmitForm();
}
