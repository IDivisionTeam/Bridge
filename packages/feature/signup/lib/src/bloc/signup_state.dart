part of 'signup_bloc.dart';

class SignUpState extends Equatable
    with FormzMixin
    implements Copyable<SignUpState> {
  SignUpState({
    required this.status,
    required this.isPasswordObscured,
    required this.isConfirmPasswordObscured,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.nickname,
  });

  SignUpState.pure()
      : status = FormzSubmissionStatus.initial,
        isPasswordObscured = true,
        isConfirmPasswordObscured = true,
        email = UserEmail.pure(),
        password = UserPassword.pure(),
        confirmPassword = UserConfirmPassword.pure(),
        nickname = UserNickname.pure();

  final FormzSubmissionStatus status;
  final bool isPasswordObscured;
  final bool isConfirmPasswordObscured;
  final UserEmail email;
  final UserPassword password;
  final UserConfirmPassword confirmPassword;
  final UserNickname nickname;

  @override
  SignUpState copy({
    FormzSubmissionStatus? status,
    bool? isPasswordObscured,
    bool? isConfirmPasswordObscured,
    UserEmail? email,
    UserPassword? password,
    UserConfirmPassword? confirmPassword,
    UserNickname? nickname,
  }) {
    return SignUpState(
      status: status ?? this.status,
      isPasswordObscured: isPasswordObscured ?? this.isPasswordObscured,
      isConfirmPasswordObscured:
          isConfirmPasswordObscured ?? this.isConfirmPasswordObscured,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      nickname: nickname ?? this.nickname,
    );
  }

  @override
  List<Object> get props => [
        status,
        isPasswordObscured,
        isConfirmPasswordObscured,
        email,
        password,
        confirmPassword,
        nickname,
      ];

  @override
  List<FormzInput<dynamic, dynamic>> get inputs => [
        email,
        nickname,
        password,
        confirmPassword,
      ];
}
