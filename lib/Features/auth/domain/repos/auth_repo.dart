import 'package:dartz/dartz.dart';
import 'package:travel_trek/Features/auth/domain/entity/user_entity.dart';
import 'package:travel_trek/core/errors/failures.dart';

abstract class AuthRepo {
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  });

  Future<Either<Failures, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  });

  Future<Either<Failures, bool>> updatePassword({
    required String email,
    required String token,
    required String password,
  });

  Future<Either<Failures, UserEntity>> signInWithGoogle();
}
