part of 'signup_bloc.dart';

abstract class SignUpEvent extends Equatable {
  const SignUpEvent();

  @override
  List<Object> get props => [];
}

class SignUpPasswordObscured extends SignUpEvent {
  const SignUpPasswordObscured();
}

class SignUpConfirmPasswordObscured extends SignUpEvent {
  const SignUpConfirmPasswordObscured();
}

class SignUpEmailChanged extends SignUpEvent {
  const SignUpEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class SignUpPasswordChanged extends SignUpEvent {
  const SignUpPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class SignUpConfirmPasswordChanged extends SignUpEvent {
  const SignUpConfirmPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class SignUpNicknameChanged extends SignUpEvent {
  const SignUpNicknameChanged(this.nickname);

  final String nickname;

  @override
  List<Object> get props => [nickname];
}

class SignUpFormSubmitted extends SignUpEvent {
  const SignUpFormSubmitted();
}
