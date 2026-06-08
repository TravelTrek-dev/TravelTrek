import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_trek/Features/auth/domain/repos/auth_repo.dart';

part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordCubit({required this.authRepo})
    : super(ChangePasswordInitial());

  final AuthRepo authRepo;

  Future<void> changePassword({
    required String email,
    required String token,
    required String password,
  }) async {
    emit(ChangePasswordLoading());
    final result = await authRepo.updatePassword(
      email: email,
      token: token,
      password: password,
    );

    result.fold(
      (failure) =>
          emit(ChangePasswordFailure(errorMessage: failure.errorMessage)),
      (_) => emit(ChangePasswordSuccess()),
    );
  }
}
