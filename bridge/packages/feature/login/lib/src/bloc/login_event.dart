part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class ObscurePassword extends LoginEvent {
  const ObscurePassword();
}

class EmailChange extends LoginEvent {
  const EmailChange(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class PasswordChange extends LoginEvent {
  const PasswordChange(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class SubmitForm extends LoginEvent {
  const SubmitForm();
}
