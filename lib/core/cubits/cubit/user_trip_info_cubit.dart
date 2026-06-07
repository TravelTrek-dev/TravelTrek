
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_trek/Features/home/data/models/user_trip_info/user_trip_info.dart';
import 'package:travel_trek/Features/home/domain/repos/home_repo.dart';

part 'user_trip_info_state.dart';

class UserTripInfoCubit extends Cubit<UserTripInfoState> {
  UserTripInfoCubit({required this.homeRepo}) : super(UserTripInfoInitial());
  final HomeRepo homeRepo;
  void getUserTripInfo({required String token}) async {
    emit(UserTripInfoLoading());
    var result = await homeRepo.getPrompts(userToken: token);
    result.fold(
      (failure) =>
          emit(UserTripInfoFailure(errorMessage: failure.errorMessage)),
      (userTripInfo) => emit(UserTripInfoSuccess(userTripInfo: userTripInfo)),
    );
  }
}
