part of 'get_all_plans_cubit.dart';

sealed class GetAllPlansState extends Equatable {
  const GetAllPlansState();

  @override
  List<Object> get props => [];
}

final class GetAllPlansInitial extends GetAllPlansState {}
final class GetAllPlansLoading extends GetAllPlansState {}
final class GetAllPlansSuccess extends GetAllPlansState {
  final List<PlanModel> plans;
  const GetAllPlansSuccess({required this.plans});
}
final class GetAllPlansFailure extends GetAllPlansState {
  final String errorMessage;
  const GetAllPlansFailure({required this.errorMessage});
}

// Delete states
final class GetAllPlansDeleteLoading extends GetAllPlansState {}
final class GetAllPlansDeleteSuccess extends GetAllPlansState {}
final class GetAllPlansDeleteFailure extends GetAllPlansState {
  final String errorMessage;
  const GetAllPlansDeleteFailure({required this.errorMessage});
}
