import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:travel_trek/Features/Budget/data/repos/expense_repo_imple.dart';
import 'package:travel_trek/Features/Budget/domain/repos/expense_repo.dart';
import 'package:travel_trek/Features/auth/data/repos/auth_repo_imple_api.dart';
import 'package:travel_trek/Features/auth/domain/repos/auth_repo.dart';
import 'package:travel_trek/Features/Plandetails/data/repos/plan_repo_imple.dart';
import 'package:travel_trek/Features/Plandetails/domain/repos/plan_repo.dart';
import 'package:travel_trek/Features/home/data/repos/home_repo_imple.dart';
import 'package:travel_trek/Features/home/domain/repos/home_repo.dart';
import 'package:travel_trek/Features/plans/data/repos/plans_repo_imple.dart';
import 'package:travel_trek/Features/plans/domain/repos/plans_repo.dart';
import 'package:travel_trek/core/helper_function/api.dart';
import 'package:travel_trek/core/helper_function/auth_interceptor.dart';
import 'package:travel_trek/core/services/firebase_auth_service.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  // getIt.registerSingleton<AuthRepo>(
  //   AuthRepoImple(firebaseAuthService: getIt<FirebaseAuthService>()),
  // );

  final dio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 60),
      receiveTimeout: const Duration(seconds: 60),
      sendTimeout: const Duration(seconds: 60),
    ),
  );

  // Register the auth interceptor for automatic token refresh on 401.
  dio.interceptors.add(AuthInterceptor(dio: dio));

  getIt.registerSingleton<Api>(Api(dio: dio));

  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpleApi(
      api: getIt<Api>(),
      firebaseAuthService: getIt<FirebaseAuthService>(),
    ),
  );
  getIt.registerSingleton<ExpenseRepo>(
    ExpenseRepoImple(apiService: getIt<Api>()),
  );
  getIt.registerSingleton<HomeRepo>(HomeRepoImple(apiService: getIt<Api>()));
  getIt.registerSingleton<PlanRepo>(PlanRepoImple(apiService: getIt<Api>()));
  getIt.registerSingleton<PlansRepo>(PlansRepoImple(apiService: getIt<Api>()));
}
