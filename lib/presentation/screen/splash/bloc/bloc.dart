import 'package:diary/presentation/base/base_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'event.dart';
part 'state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(const SplashState()) {
    on<OnInit>((event, emit) async {
      await Future.delayed(const Duration(seconds: 1), () {
        emit(state.copyWith(onNavigateRouteName: '/onboarding'));
      });
    });
  }
}
