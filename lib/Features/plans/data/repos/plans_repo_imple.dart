import 'package:dartz/dartz.dart';
import 'package:travel_trek/Features/home/data/models/plan_model/plan_model.dart';
import 'package:travel_trek/Features/plans/domain/repos/plans_repo.dart';
import 'package:travel_trek/core/errors/failures.dart';
import 'package:travel_trek/core/helper_function/api.dart';
import 'package:travel_trek/core/services/backend_service.dart';

class PlansRepoImple implements PlansRepo {
  final Api apiService;

  PlansRepoImple({required this.apiService});
  @override
  Future<Either<Failures, List<PlanModel>>> getAllPlans({
    required String token,
  }) async {
    try {
      var response = await apiService.get(
        url: BackendService.getAllPlans,
        token: token,
      );
      List<PlanModel> plans = PlanModel.fromHistoryJson(response);
     
      return right(plans);
    } on Exception catch (e) {
      return left(ServerFailure(errorMessage: e.toString()));
    }
  }
}
