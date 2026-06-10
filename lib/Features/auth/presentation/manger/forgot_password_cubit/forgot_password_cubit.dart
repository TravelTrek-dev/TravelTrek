import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_trek/Features/auth/domain/repos/auth_repo.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordCubit({required this.authRepo}) : super(ForgotPasswordInitial());

  final AuthRepo authRepo;

  Future<void> forgotPassword({required String email}) async {
    emit(ForgotPasswordLoading());
    final result = await authRepo.forgotPassword(email: email);
    result.fold(
      (failure) => emit(ForgotPasswordFailure(errorMessage: failure.errorMessage)),
      (message) => emit(ForgotPasswordSuccess(message: message)),
    );
  }
}
