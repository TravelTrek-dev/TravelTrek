import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_trek/Features/home/data/models/plan_model/plan_model.dart';
import 'package:travel_trek/Features/Plandetails/domain/repos/plan_repo.dart';

part 'plan_details_state.dart';

class PlanDetailsCubit extends Cubit<PlanDetailsState> {
  PlanDetailsCubit({required this.planRepo}) : super(PlanDetailsInitial());

  final PlanRepo planRepo;

  Future<void> savePlan({
    required PlanModel planModel,
    required String userToken,
  }) async {
    emit(PlanDetailsLoading());
    final result = await planRepo.savePlan(
      planModel: planModel,
      userToken: userToken,
    );

    result.fold(
      (failure) => emit(PlanDetailsFailure(errorMessage: failure.errorMessage)),
      (savedPlan) => emit(PlanDetailsSuccess()),
    );
  }
}
