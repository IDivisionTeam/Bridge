import 'package:core_common/common.dart';
import 'package:core_data/data.dart';
import 'package:core_model/model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc({
    required AuthenticationRepository authenticationRepository,
  })  : _authenticationRepository = authenticationRepository,
        super(LoginState.pure()) {
    on<LoginPasswordObscured>(_loginPasswordObscured);
    on<LoginEmailChanged>(_loginEmailChanged);
    on<LoginPasswordChanged>(_loginPasswordChanged);
    on<LoginFormSubmitted>(_loginFormSubmitted);
  }

  final AuthenticationRepository _authenticationRepository;

  void _loginPasswordObscured(
    LoginPasswordObscured event,
    Emitter<LoginState> emit,
  ) {
    emit(
      state.copy(
        isTextObscured: !state.isTextObscured,
      ),
    );
  }

  void _loginEmailChanged(
    LoginEmailChanged event,
    Emitter<LoginState> emit,
  ) {
    final email = UserEmail.dirty(event.email);
    emit(state.copy(email: email));
    Formz.validate([email]);
  }

  void _loginPasswordChanged(
    LoginPasswordChanged event,
    Emitter<LoginState> emit,
  ) {
    final password = UserPassword.dirty(event.password);
    emit(state.copy(password: password));
    Formz.validate([password]);
  }

  Future<void> _loginFormSubmitted(
    LoginFormSubmitted event,
    Emitter<LoginState> emit,
  ) async {
    if (state.isValid) {
      emit(state.copy(status: FormzSubmissionStatus.inProgress));

      try {
        await _authenticationRepository.login(
          email: state.email.value,
          password: state.password.value,
        );

        // FIXME(login): check response, if error -> do not set status as success
        emit(state.copy(status: FormzSubmissionStatus.success));
      } catch (_) {
        emit(state.copy(status: FormzSubmissionStatus.failure));
      }
    }
  }
}
