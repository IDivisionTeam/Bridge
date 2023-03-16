import 'package:bloc/bloc.dart';
import 'package:common/common.dart';
import 'package:core_data/data.dart';
import 'package:equatable/equatable.dart';
import 'package:formz/formz.dart';
import 'package:model/model.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(LoginState.pure()) {
    on<ObscurePassword>(_onObscurePasswordChange);
    on<EmailChange>(_onEmailChange);
    on<PasswordChange>(_onPasswordChange);
    on<SubmitForm>(_onFormSubmit);
  }

  final AuthenticationRepository _authenticationRepository;

  void _onObscurePasswordChange(
    ObscurePassword event,
    Emitter<LoginState> emit,
  ) {
    emit(
      state.copy(
        isTextObscured: !state.isTextObscured,
      ),
    );
  }

  void _onEmailChange(
    EmailChange event,
    Emitter<LoginState> emit,
  ) {
    final email = UserEmail.dirty(event.email);
    emit(state.copy(email: email));
    Formz.validate([email]);
  }

  void _onPasswordChange(
    PasswordChange event,
    Emitter<LoginState> emit,
  ) {
    final password = UserPassword.dirty(event.password);
    emit(state.copy(password: password));
    Formz.validate([password]);
  }

  Future<void> _onFormSubmit(
    SubmitForm event,
    Emitter<LoginState> emit,
  ) async {
    if (state.isValid) {
      emit(state.copy(status: FormzSubmissionStatus.inProgress));

      try {
        await _authenticationRepository.login(
          email: state.email.value,
          password: state.password.value,
        );
        emit(state.copy(status: FormzSubmissionStatus.success));
      } catch (_) {
        emit(state.copy(status: FormzSubmissionStatus.failure));
      }
    }
  }
}