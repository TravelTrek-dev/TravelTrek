import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:travel_trek/Features/auth/data/models/user_model.dart';
import 'package:travel_trek/Features/auth/domain/entity/user_entity.dart';
import 'package:travel_trek/Features/auth/domain/repos/auth_repo.dart';
import 'package:travel_trek/constants.dart';
import 'package:travel_trek/core/errors/custom_exception.dart';
import 'package:travel_trek/core/errors/failures.dart';
import 'package:travel_trek/core/helper_function/api.dart';
import 'package:travel_trek/core/services/backend_service.dart';
import 'package:travel_trek/core/services/firebase_auth_service.dart';
import 'package:travel_trek/core/services/prefs.dart';

class AuthRepoImpleApi implements AuthRepo {
  FirebaseAuthService firebaseAuthService;

  final Api api;

  AuthRepoImpleApi({required this.api, required this.firebaseAuthService});
  @override
  Future<Either<Failures, UserEntity>> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
  }) async {
    var body = {'email': email, 'password': password, 'fullName': name};
    try {
      await api.post(url: BackendService.singupUrl, body: body);
      return right(
        UserEntity(name: name, email: email, uId: 'N/A', accessToken: 'N/A', refreshToken: 'N/A'),
      );
    } on CustomException catch (e) {
      return left(ServerFailure(errorMessage: e.message));
    } on DioException catch (e) {
      if (e.response != null && e.response!.data != null) {
        final String errorMessage =
            e.response!.data['message'] ?? 'An unexpected error occurred';

        return left(ServerFailure(errorMessage: errorMessage));
      } else {
        return left(
          ServerFailure(errorMessage: e.message ?? 'Connection error'),
        );
      }
    } catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    var body = {'email': email, 'password': password};
    try {
      var data = await api.post(url: BackendService.signinUrl, body: body);
      return right(UserModel.fromJson(data));
    } on CustomException catch (e) {
      log(
        'Exception in AuthRepoImpleApi.signInWithEmailAndPassword: ${e.toString()}',
      );
      return left(ServerFailure(errorMessage: e.message));
    } catch (e) {
      log(
        'Exception in AuthRepoImpleApi.signInWithEmailAndPassword: ${e.toString()}',
      );
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, bool>> updatePassword({
    required String email,
    required String token,
    required String password,
  }) async {
    try {
      await api.post(
        url: '${BackendService.forgotPasswordUrl}?token=$token',
        body: {'email': email, 'password': password},
      );
      return right(true);
    } on CustomException catch (e) {
      return left(ServerFailure(errorMessage: e.message));
    } catch (e) {
      log('Exception in AuthRepoImpleApi.updatePassword: ${e.toString()}');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, UserEntity>> signInWithGoogle() async {
    try {
      var user = await firebaseAuthService.signInWithGoogle();
      return right(UserModel.formFireBaseUser(user: user));
    } on CustomException catch (e) {
      return left(ServerFailure(errorMessage: e.message));
    } catch (e) {
      log('Exception in AuthRepoImple.signInWithGoogle: ${e.toString()}');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, String>> forgotPassword({
    required String email,
  }) async {
    try {
      final token = Prefs.getString(kUserAccessToken);
      final data = await api.post(
        url: BackendService.forgotPasswordUrl,
        body: {'email': email},
        token: token.isNotEmpty ? token : null,
      );
      final message = (data is Map && data['message'] != null)
          ? data['message'].toString()
          : 'Password reset email sent successfully.';
      return right(message);
    } on CustomException catch (e) {
      return left(ServerFailure(errorMessage: e.message));
    } catch (e) {
      log('Exception in AuthRepoImpleApi.forgotPassword: ${e.toString()}');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, String>> resendVerification({
    required String email,
  }) async {
    try {
      final token = Prefs.getString(kUserAccessToken);
      final data = await api.post(
        url: BackendService.resendConfirmationUrl,
        body: {'email': email},
        token: token.isNotEmpty ? token : null,
      );
      final message = (data is Map && data['message'] != null)
          ? data['message'].toString()
          : 'Verification email sent successfully.';
      return right(message);
    } on CustomException catch (e) {
      return left(ServerFailure(errorMessage: e.message));
    } catch (e) {
      log('Exception in AuthRepoImpleApi.resendVerification: ${e.toString()}');
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
