part of 'bloc.dart';

@immutable
class LoginState extends BaseState {
  const LoginState({
    bool isLoading = false,
    String? errorToastMessage,
  }) : super(isLoading: isLoading, errorToastMessage: errorToastMessage ?? '');

  LoginState copyWith({
    bool? isLoading,
    String? errorToastMessage,
  }) {
    return LoginState(
      isLoading: isLoading ?? this.isLoading,
      errorToastMessage: errorToastMessage ?? '',
    );
  }

  @override
  List<Object?> get props => [isLoading, errorToastMessage];
}
