import 'package:core_designsystem/designsystem.dart';
import 'package:core_model/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:feature_signup/src/bloc/signup_bloc.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key, required this.onNavBackClick});

  final VoidCallback? onNavBackClick;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Authentication Failure')),
            );
        }

        if (state.status.isSuccess) {
          // TODO(home): context.navigateToHome();
        }
      },
      child: Column(
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
          _UserNicknameInput(),
          const SizedBox(
            height: 16,
            width: double.infinity,
          ),
          _UserEmailInput(),
          const SizedBox(
            height: 32,
            width: double.infinity,
          ),
          _UserPassword(),
          const SizedBox(
            height: 16,
            width: double.infinity,
          ),
          _UserConfirmPassword(),
          const SizedBox(
            height: 48,
          ),
          _UserSubmitButton(),
          const Spacer(),
        ],
      ),
    );
  }
}

class _UserNicknameInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) => previous.nickname != current.nickname,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Nickname',
              helperText: 'At least 3 characters, maximum 15',
              errorText: _getError(state.nickname.displayError),
            ),
            onChanged: (value) => context.read<SignUpBloc>().add(NicknameChange(value)),
          ),
        );
      },
    );
  }

  String? _getError(UserNicknameError? error) {
    switch (error) {
      case UserNicknameError.empty:
        return 'Nickname can\'t be empty';
      case UserNicknameError.minLength:
        return 'Min length: 3 characters';
      case UserNicknameError.maxLength:
        return 'Max length: 15 characters';
      case UserNicknameError.restrictedCharacters:
        return 'Can contain only numbers & letters';
      default:
        return null;
    }
  }
}

class _UserEmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
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
            onChanged: (value) => context.read<SignUpBloc>().add(EmailChange(value)),
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
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) {
        return previous.password != current.password || previous.isPasswordObscured != current.isPasswordObscured;
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            obscureText: state.isPasswordObscured,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: 'Password',
              helperText: 'At least 8 characters including one letter and number',
              errorText: _getError(state.password.displayError),
              suffixIcon: IconButton(
                icon: _getIcon(isTextObscured: state.isPasswordObscured),
                onPressed: () {
                  context.read<SignUpBloc>().add(ObscurePassword());
                },
              ),
            ),
            onChanged: (value) => context.read<SignUpBloc>().add(PasswordChange(value)),
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

class _UserConfirmPassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) {
        return previous.confirmPassword != current.confirmPassword ||
            previous.isConfirmPasswordObscured != current.isConfirmPasswordObscured;
      },
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: TextField(
            obscureText: state.isConfirmPasswordObscured,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: 'Confirm password',
              errorText: _getError(state.confirmPassword.displayError),
              suffixIcon: IconButton(
                icon: _getIcon(isTextObscured: state.isConfirmPasswordObscured),
                onPressed: () {
                  context.read<SignUpBloc>().add(ObscureConfirmPassword());
                },
              ),
            ),
            onChanged: (value) => context.read<SignUpBloc>().add(ConfirmPasswordChange(value)),
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

  String? _getError(UserConfirmPasswordError? error) {
    switch (error) {
      case UserConfirmPasswordError.empty:
        return 'Password can\'t be empty';
      case UserConfirmPasswordError.mismatch:
        return 'Password does not match';
      default:
        return null;
    }
  }
}

class _UserSubmitButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      buildWhen: (previous, current) => previous.status != current.status,
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: BridgeButton(
            onClick: (state.status.isInitial || state.status.isFailure)
                ? () => context.read<SignUpBloc>().add(SubmitForm())
                : null,
            child: const Text('Sign up'),
          ),
        );
      },
    );
  }
}
