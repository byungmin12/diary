import 'package:diary/presentation/base/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'event.dart';
part 'state.dart';

class OnBoardingBloc extends Bloc<OnBoardingEvent, OnBoardingState> {
  OnBoardingBloc() : super(const OnBoardingState()) {
    on<OnInit>((event, emit) async {
      await Future.delayed(const Duration(seconds: 1), () {
        emit(state.copyWith(onNavigateRouteName: '/onboarding'));
      });
    });
  }
}
