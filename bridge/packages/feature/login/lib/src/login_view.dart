import 'package:core_designsystem/designsystem.dart';
import 'package:core_model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:feature_login/src/bloc/login_bloc.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key, required this.onNavBackClick});

  final VoidCallback? onNavBackClick;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      builder: (context, state) {
        return Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    onNavBackClick?.call();
                  },
                ),
              ],
            ),
            const Spacer(),
            _UserEmailInput(),
            const SizedBox(
              height: 32,
              width: double.infinity,
            ),
            _UserPassword(),
            const SizedBox(
              height: 48,
            ),
            _UserSubmitButton(),
            const Spacer(),
          ],
        );
      },
    );
  }
}

class _UserEmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.email != current.email,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email',
              errorText: _getError(state.email.displayError),
            ),
            onChanged: (value) => context.read<LoginBloc>().add(EmailChange(value)),
          ),
        );
      },
    );
  }

  String? _getError(UserEmailError? error) {
    switch (error) {
      case UserEmailError.empty:
        return 'Email can\'t be empty';
      case UserEmailError.invalid:
        return 'Please ensure the email entered is valid';
      default:
        return null;
    }
  }
}

class _UserPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) {
        return previous.password != current.password || previous.isTextObscured != current.isTextObscured;
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            obscureText: state.isTextObscured,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: 'Password',
              errorText: _getError(state.password.displayError),
              suffixIcon: IconButton(
                icon: _getIcon(isTextObscured: state.isTextObscured),
                onPressed: () {
                  context.read<LoginBloc>().add(ObscurePassword());
                },
              ),
            ),
            onChanged: (value) => context.read<LoginBloc>().add(PasswordChange(value)),
          ),
        );
      },
    );
  }

  Icon _getIcon({required bool isTextObscured}) {
    Icon icon;
    if (isTextObscured) {
      icon = const Icon(Icons.visibility_off);
    } else {
      icon = const Icon(Icons.visibility);
    }

    return icon;
  }

  String? _getError(UserPasswordError? error) {
    switch (error) {
      case UserPasswordError.empty:
        return 'Password can\'t be empty';
      case UserPasswordError.invalid:
        return '''Must be at least 8 characters, contain at least 1 letter and number''';
      default:
        return null;
    }
  }
}

class _UserSubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginBloc, LoginState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BridgeButton(
            onClick: (state.status.isInitial || state.status.isFailure)
                ? () => context.read<LoginBloc>().add(SubmitForm())
                : null,
            child: const Text('Login'),
          ),
        );
      },
    );
  }
}
