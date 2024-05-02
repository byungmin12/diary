part of 'bloc.dart';

@immutable
abstract class OnBoardingEvent {
  const OnBoardingEvent._();

  const factory OnBoardingEvent.onInit() = OnInit;
}

class OnInit extends OnBoardingEvent {
  const OnInit() : super._();
}
