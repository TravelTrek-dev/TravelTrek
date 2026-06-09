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
    var result = await plansRepo.getAllPlans(token: token);
    result.fold(
      (failure) => emit(GetAllPlansFailure(errorMessage: failure.errorMessage)),
      (planModel) => emit(GetAllPlansSuccess(plans: planModel)),
    );
  }

  Future<void> deletePlan({
    required String token,
    required String planId,
  }) async {
    emit(GetAllPlansDeleteLoading());
    final result = await plansRepo.deletePlan(token: token, planId: planId);
    result.fold(
      (failure) => emit(GetAllPlansDeleteFailure(errorMessage: failure.errorMessage)),
      (_) async {
        emit(GetAllPlansDeleteSuccess());
        // بعد الحذف، جيب القائمة المحدّثة
        await getAllPlans(token: token);
      },
    );
  }
}
