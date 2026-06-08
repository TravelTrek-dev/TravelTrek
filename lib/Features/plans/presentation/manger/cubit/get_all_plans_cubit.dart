import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_trek/Features/home/data/models/plan_model/plan_model.dart';
import 'package:travel_trek/Features/plans/domain/repos/plans_repo.dart';

part 'get_all_plans_state.dart';

class GetAllPlansCubit extends Cubit<GetAllPlansState> {
  GetAllPlansCubit({required this.plansRepo}) : super(GetAllPlansInitial());

  final PlansRepo plansRepo;

  Future<void> getAllPlans({required String token}) async {
    emit(GetAllPlansLoading());
    var reuslt = await plansRepo.getAllPlans(token: token);

    reuslt.fold(
      (failure) => emit(GetAllPlansFailure(errorMessage: failure.errorMessage)),
      (planModel) => emit(GetAllPlansSuccess(plans: planModel)),
    );
  }
}
