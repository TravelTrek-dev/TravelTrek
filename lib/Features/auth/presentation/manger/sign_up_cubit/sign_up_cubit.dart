import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_trek/Features/auth/domain/entity/user_entity.dart';
import 'package:travel_trek/Features/auth/domain/repos/auth_repo.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit({required this.authRepo}) : super(SignUpInitial());

  final AuthRepo authRepo;

  Future<void> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    emit(SignUpLoading());

    final result = await authRepo.createUserWithEmailAndPassword(
      name: name,
      email: email,
      password: password,
    );
    result.fold(
      (failure) => emit(SignUpFailure(errorMessage: failure.errorMessage)),
      (userEntity) => emit(SignUpSuccess(userEntity: userEntity)),
    );
  }
}
