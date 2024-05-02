import 'package:diary/presentation/screen/onboarding/bloc/bloc.dart';
import 'package:diary/presentation/screen/onboarding/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnBoardingBloc()..add(const OnBoardingEvent.onInit()),
      child: const OnBoardingView(),
    );
  }
}
