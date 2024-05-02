part of 'bloc.dart';

@immutable
class SplashState extends BaseState {
  final String? onNavigateRouteName;

  const SplashState({
    bool isLoading = false,
    String? errorToastMessage,
    this.onNavigateRouteName,
  }) : super(isLoading: isLoading, errorToastMessage: errorToastMessage ?? '');

  SplashState copyWith({
    bool? isLoading,
    String? errorToastMessage,
    String? onNavigateRouteName,
  }) {
    return SplashState(
      isLoading: isLoading ?? this.isLoading,
      errorToastMessage: errorToastMessage ?? '',
      onNavigateRouteName: onNavigateRouteName ?? this.onNavigateRouteName,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        errorToastMessage,
        onNavigateRouteName,
      ];
}
