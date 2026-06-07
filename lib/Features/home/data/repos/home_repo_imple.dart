import 'package:dartz/dartz.dart';
import 'package:travel_trek/Features/home/data/models/plan_model/plan_model.dart';
import 'package:travel_trek/Features/home/data/models/user_trip_info/user_trip_info.dart';
import 'package:travel_trek/Features/home/domain/repos/home_repo.dart';
import 'package:travel_trek/core/errors/failures.dart';
import 'package:travel_trek/core/helper_function/api.dart';
import 'package:travel_trek/core/services/backend_service.dart';

class HomeRepoImple extends HomeRepo {
  final Api apiService;

  HomeRepoImple({required this.apiService});

  @override
  Future<Either<Failures, PlanModel>> generatePlan({
    required String userToken,
    required String promot,
  }) async {
    var body = {'prompt': promot};
    try {
      var response = await apiService.post(
        url: BackendService.generatePlanUrl,
        body: body,
        token: userToken,
      );
      return right(PlanModel.fromJson(response));
    } on Exception catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, UserTripInfo>> getPrompts({
    required String userToken,
  }) async {
    try {
      var response = await apiService.get(
        url: BackendService.getPromptsUrl,
        token: userToken,
      );
      return right(UserTripInfo.fromJson(response));
    } on Exception catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
