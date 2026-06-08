part of 'plan_details_cubit.dart';

sealed class PlanDetailsState extends Equatable {
  const PlanDetailsState();

  @override
  List<Object> get props => [];
}

final class PlanDetailsInitial extends PlanDetailsState {}

final class PlanDetailsLoading extends PlanDetailsState {}

final class PlanDetailsSuccess extends PlanDetailsState {


  @override
  List<Object> get props => [];
}

final class PlanDetailsFailure extends PlanDetailsState {
  final String errorMessage;

  const PlanDetailsFailure({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
