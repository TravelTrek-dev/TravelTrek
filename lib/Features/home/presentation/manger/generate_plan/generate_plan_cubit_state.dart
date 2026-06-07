part of 'generate_plan_cubit_cubit.dart';

sealed class GeneratePlanCubitState extends Equatable {
  const GeneratePlanCubitState();

  @override
  List<Object> get props => [];
}

final class GeneratePlanCubitInitial extends GeneratePlanCubitState {}

final class GeneratePlanCubitLoading extends GeneratePlanCubitState {}

final class GeneratePlanCubitSuccess extends GeneratePlanCubitState {
  final PlanModel planModel;
  const GeneratePlanCubitSuccess({required this.planModel});
  @override
  List<Object> get props => [planModel];
}

final class GeneratePlanCubitFailure extends GeneratePlanCubitState {
  final String errorMessage;
  const GeneratePlanCubitFailure({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
