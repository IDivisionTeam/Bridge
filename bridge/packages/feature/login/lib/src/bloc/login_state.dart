part of 'login_bloc.dart';

class LoginState extends Equatable
    with FormzMixin
    implements Copyable<LoginState> {
  LoginState({
    required this.status,
    required this.isTextObscured,
    required this.email,
    required this.password,
  });

  LoginState.pure()
      : status = FormzSubmissionStatus.initial,
        isTextObscured = true,
        email = UserEmail.pure(),
        password = UserPassword.pure();

  final FormzSubmissionStatus status;
  final bool isTextObscured;
  final UserEmail email;
  final UserPassword password;

  @override
  LoginState copy({
    FormzSubmissionStatus? status,
    bool? isTextObscured,
    UserEmail? email,
    UserPassword? password,
  }) {
    return LoginState(
      status: status ?? this.status,
      isTextObscured: isTextObscured ?? this.isTextObscured,
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }

  @override
  List<Object> get props => [isTextObscured, email, password];

  @override
  List<FormzInput<dynamic, dynamic>> get inputs => [email, password];
}
