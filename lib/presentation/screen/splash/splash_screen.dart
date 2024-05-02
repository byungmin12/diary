import 'package:diary/presentation/screen/splash/bloc/bloc.dart';
import 'package:diary/presentation/screen/splash/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  _onRedirect(BuildContext context, String? route) {
    if (route == null) return;

    context.go(route);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SplashBloc()..add(const SplashEvent.onInit()),
      child: _buildListener(),
    );
  }

  Widget _buildListener() {
    return BlocListener<SplashBloc, SplashState>(
      listener: (context, state) => _onRedirect(context, state.onNavigateRouteName),
      child: const SplashView(),
    );
  }
}
