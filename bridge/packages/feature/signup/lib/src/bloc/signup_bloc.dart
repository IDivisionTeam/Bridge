import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:core_common/common.dart';
import 'package:core_data/data.dart';
import 'package:core_model/model.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';

part 'signup_event.dart';
part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(SignUpState.pure()) {
    on<ObscurePassword>(_onObscurePasswordChange);
    on<ObscureConfirmPassword>(_onObscureConfirmPasswordChange);
    on<EmailChange>(_onEmailChange);
    on<NicknameChange>(_onNicknameChange);
    on<PasswordChange>(_onPasswordChange);
    on<ConfirmPasswordChange>(_onConfirmPasswordChange);
    on<SubmitForm>(_onFormSubmit);
  }

  final AuthenticationRepository _authenticationRepository;

  void _onObscurePasswordChange(
    ObscurePassword event,
    Emitter<SignUpState> emit,
  ) {
    emit(
      state.copy(
        isPasswordObscured: !state.isPasswordObscured,
      ),
    );
  }

  void _onObscureConfirmPasswordChange(
    ObscureConfirmPassword event,
    Emitter<SignUpState> emit,
  ) {
    emit(
      state.copy(
        isConfirmPasswordObscured: !state.isConfirmPasswordObscured,
      ),
    );
  }

  void _onEmailChange(
    EmailChange event,
    Emitter<SignUpState> emit,
  ) {
    final email = UserEmail.dirty(event.email);
    emit(state.copy(email: email));
    Formz.validate([email]);
  }

  void _onNicknameChange(
    NicknameChange event,
    Emitter<SignUpState> emit,
  ) {
    final nickname = UserNickname.dirty(event.nickname);
    emit(state.copy(nickname: nickname));
    Formz.validate([nickname]);
  }

  void _onPasswordChange(
    PasswordChange event,
    Emitter<SignUpState> emit,
  ) {
    final password = UserPassword.dirty(event.password);
    emit(state.copy(password: password));
    Formz.validate([password]);
  }

  void _onConfirmPasswordChange(
    ConfirmPasswordChange event,
    Emitter<SignUpState> emit,
  ) {
    final password = UserConfirmPassword.dirty(
      passwordToCompare: state.password.value,
      value: event.password,
    );

    emit(state.copy(confirmPassword: password));
    Formz.validate([password]);
  }

  Future<void> _onFormSubmit(
    SubmitForm event,
    Emitter<SignUpState> emit,
  ) async {
    if (state.isValid) {
      emit(state.copy(status: FormzSubmissionStatus.inProgress));

      try {
        await _authenticationRepository.signup(
          email: state.email.value,
          nickname: state.nickname.value,
          password: state.password.value,
        );
        emit(state.copy(status: FormzSubmissionStatus.success));
      } catch (_) {
        emit(state.copy(status: FormzSubmissionStatus.failure));
      }
    }
  }
}
