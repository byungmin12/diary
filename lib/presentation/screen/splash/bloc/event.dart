part of 'bloc.dart';

@immutable
abstract class SplashEvent {
  const SplashEvent._();

  const factory SplashEvent.onInit() = OnInit;
}

class OnInit extends SplashEvent {
  const OnInit() : super._();
}
