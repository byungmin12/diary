import 'package:diary/presentation/screen/auth/login/bloc/bloc.dart';
import 'package:diary/presentation/screen/auth/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginBloc()..add(const LoginEvent.onInit()),
      child: LoginView(),
    );
  }
}
