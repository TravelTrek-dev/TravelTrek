part of 'user_trip_info_cubit.dart';

sealed class UserTripInfoState extends Equatable {
  const UserTripInfoState();

  @override
  List<Object> get props => [];
}

final class UserTripInfoInitial extends UserTripInfoState {}
final class UserTripInfoLoading extends UserTripInfoState {}
final class UserTripInfoSuccess extends UserTripInfoState {
  final UserTripInfo userTripInfo;

  const UserTripInfoSuccess({required this.userTripInfo});
}
final class UserTripInfoFailure extends UserTripInfoState {
  final String errorMessage;

  const UserTripInfoFailure({required this.errorMessage});
}

