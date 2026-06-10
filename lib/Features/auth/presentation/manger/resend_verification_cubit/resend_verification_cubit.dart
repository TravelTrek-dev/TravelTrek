import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_trek/Features/auth/domain/repos/auth_repo.dart';

part 'resend_verification_state.dart';

class ResendVerificationCubit extends Cubit<ResendVerificationState> {
  ResendVerificationCubit({required this.authRepo})
      : super(ResendVerificationInitial());

  final AuthRepo authRepo;

  Future<void> resendVerification({required String email}) async {
    emit(ResendVerificationLoading());
    final result = await authRepo.resendVerification(email: email);
    result.fold(
      (failure) =>
          emit(ResendVerificationFailure(errorMessage: failure.errorMessage)),
      (message) => emit(ResendVerificationSuccess(message: message)),
    );
  }
}
