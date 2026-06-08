import 'package:dartz/dartz.dart';
import 'package:travel_trek/Features/home/data/models/plan_model/plan_model.dart';
import 'package:travel_trek/Features/Plandetails/domain/repos/plan_repo.dart';
import 'package:travel_trek/core/errors/failures.dart';
import 'package:travel_trek/core/helper_function/api.dart';
import 'package:travel_trek/core/services/backend_service.dart';

class PlanRepoImple implements PlanRepo {
  final Api apiService;

  PlanRepoImple({required this.apiService});

  @override
  Future<Either<Failures, void>> savePlan({
    required PlanModel planModel,
    required String userToken,
  }) async {
    try {
      final response = await apiService.post(
        url: BackendService.savePlanUrl,
        body: planModel.toSavePlan(),
        token: userToken,
      );
     return right(null);
    } on Exception catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
