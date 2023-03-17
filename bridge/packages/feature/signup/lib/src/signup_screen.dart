import 'package:core_data/data.dart';
import 'package:feature_signup/src/bloc/signup_bloc.dart';
import 'package:feature_signup/src/signup_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({
    super.key,
    required this.onNavBackClick,
    required this.onNavHomeRequest,
  });

  final VoidCallback? onNavBackClick;
  final VoidCallback? onNavHomeRequest;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SignUpBloc(
        authenticationRepository:
            RepositoryProvider.of<AuthenticationRepository>(context),
      ),
      child: SignUpView(
        onNavBackClick: onNavBackClick,
        onNavHomeRequest: onNavHomeRequest,
      ),
    );
  }
}
