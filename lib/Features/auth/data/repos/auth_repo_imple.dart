import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:travel_trek/Features/auth/data/models/user_model.dart';
import 'package:travel_trek/Features/auth/domain/entity/user_entity.dart';
import 'package:travel_trek/Features/auth/domain/repos/auth_repo.dart';
import 'package:travel_trek/core/errors/custom_exception.dart';
import 'package:travel_trek/core/errors/failures.dart';
import 'package:travel_trek/core/services/firebase_auth_service.dart';

class AuthRepoImple implements AuthRepo {
  FirebaseAuthService firebaseAuthService;

  AuthRepoImple({required this.firebaseAuthService});

  @override
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      var user = await firebaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
        name: name,
      );

      return right(UserModel.formFireBaseUser(user: user));
    } on CustomException catch (e) {
      return left(ServerFailure(errorMessage: e.message));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
      try {
      var user = await firebaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return right(UserModel.formFireBaseUser(user: user));
    } on CustomException catch (e) {
      return left(ServerFailure(errorMessage: e.message));
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }

  }
  
 @override
  Future<Either<Failures, UserEntity>> signInWithGoogle() async {
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      return right(UserModel.formFireBaseUser( user: user));
    } on CustomException catch (e) {
      return left(ServerFailure(errorMessage: e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImple.signInWithGoogle: ${e.toString()}',
      );
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
