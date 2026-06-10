part of 'resend_verification_cubit.dart';

sealed class ResendVerificationState {}

final class ResendVerificationInitial extends ResendVerificationState {}

final class ResendVerificationLoading extends ResendVerificationState {}

final class ResendVerificationSuccess extends ResendVerificationState {
  final String message;
  ResendVerificationSuccess({required this.message});
}

final class ResendVerificationFailure extends ResendVerificationState {
  final String errorMessage;
  ResendVerificationFailure({required this.errorMessage});
}
