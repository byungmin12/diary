part of 'bloc.dart';

@immutable
abstract class LoginEvent {
  const LoginEvent._();

  const factory LoginEvent.onInit() = OnInit;
}

class OnInit extends LoginEvent {
  const OnInit() : super._();
}
