import 'package:core_data/data.dart';
import 'package:feature_login/src/bloc/login_bloc.dart';
import 'package:feature_login/src/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({
    super.key,
    required AuthenticationRepository authenticationRepository,
    required this.onNavBackClick,
    required this.onNavHomeRequest,
  }) : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;
  final VoidCallback? onNavBackClick;
  final VoidCallback? onNavHomeRequest;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc(
        authenticationRepository: _authenticationRepository,
      ),
      child: LoginView(
        onNavBackClick: onNavBackClick,
        onNavHomeRequest: onNavHomeRequest,
      ),
    );
  }
}
