import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_trek/Features/home/data/models/plan_model/plan_model.dart';
import 'package:travel_trek/Features/home/domain/repos/home_repo.dart';

part 'generate_plan_cubit_state.dart';

class GeneratePlanCubitCubit extends Cubit<GeneratePlanCubitState> {
  GeneratePlanCubitCubit({required this.homeRepo})
    : super(GeneratePlanCubitInitial());
  final HomeRepo homeRepo;
  void generatePlan({required String userToken, required String promot}) async {
    emit(GeneratePlanCubitLoading());
    final result = await homeRepo.generatePlan(
      userToken: userToken,
      promot: promot,
    );
    result.fold(
      (failure) {
        if (!isClosed) {
          emit(GeneratePlanCubitFailure(errorMessage: failure.errorMessage));
        }
      },
      (plan) {
        if (!isClosed) {
          emit(GeneratePlanCubitSuccess(planModel: plan));
        }
      },
    );
  }
}
