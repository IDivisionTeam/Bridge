import 'package:core_data/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:feature_login/src/bloc/login_bloc.dart';
import 'package:feature_login/src/login_view.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, required this.onNavBackClick});

  final VoidCallback? onNavBackClick;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(
        authenticationRepository:
            RepositoryProvider.of<AuthenticationRepository>(context),
      ),
      child: LoginView(
        onNavBackClick: onNavBackClick,
      ),
    );
  }
}
