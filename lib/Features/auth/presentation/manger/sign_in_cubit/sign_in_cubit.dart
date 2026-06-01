import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_trek/Features/auth/domain/entity/user_entity.dart';
import 'package:travel_trek/Features/auth/domain/repos/auth_repo.dart';

part 'sign_in_state.dart';

class SignInCubit extends Cubit<SignInState> {
  SignInCubit({required this.authRepo}) : super(SignInInitial());

  final AuthRepo authRepo;

  void signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    emit(SignInLoading());
    final result = await authRepo.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    result.fold(
      (failure) => emit(SignInFailure(errorMessage: failure.errorMessage)),
      (userEntity) => emit(SignInSuccess(userEntity: userEntity)),
    );
  }

  Future<void> signInWithGoogle() async {
    emit(SignInLoading());
    final result = await authRepo.signInWithGoogle();
    result.fold(
      (failure) => emit(SignInFailure(errorMessage: failure.errorMessage)),
      (userEntity) => emit(SignInSuccess(userEntity: userEntity)),
    );
  }
}
