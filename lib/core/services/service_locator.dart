import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:travel_trek/Features/auth/data/repos/auth_repo_imple_api.dart';
import 'package:travel_trek/Features/auth/domain/repos/auth_repo.dart';
import 'package:travel_trek/core/helper_function/api.dart';
import 'package:travel_trek/core/services/firebase_auth_service.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  // getIt.registerSingleton<AuthRepo>(
  //   AuthRepoImple(firebaseAuthService: getIt<FirebaseAuthService>()),
  // );
  getIt.registerSingleton<Api>(Api(dio: Dio()));
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpleApi(
      api: getIt<Api>(),
      firebaseAuthService: getIt<FirebaseAuthService>(),
    ),
  );
}
