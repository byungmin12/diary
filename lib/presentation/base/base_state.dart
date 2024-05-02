import 'package:equatable/equatable.dart';

abstract class BaseState extends Equatable {
  final bool isLoading;
  final String errorToastMessage;

  const BaseState({
    this.isLoading = false,
    this.errorToastMessage = '',
  });

  @override
  List<Object?> get props => [isLoading, errorToastMessage];
}
