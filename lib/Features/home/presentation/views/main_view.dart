import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_trek/Features/home/domain/repos/home_repo.dart';
import 'package:travel_trek/Features/home/presentation/views/widgets/bottom_navigation_bar.dart';
import 'package:travel_trek/Features/home/presentation/views/widgets/main_view_body.dart';
import 'package:travel_trek/Features/plans/domain/repos/plans_repo.dart';
import 'package:travel_trek/Features/plans/presentation/manger/cubit/get_all_plans_cubit.dart';
import 'package:travel_trek/constants.dart';
import 'package:travel_trek/core/cubits/cubit/user_trip_info_cubit.dart';
import 'package:travel_trek/core/services/prefs.dart';
import 'package:travel_trek/core/services/service_locator.dart';
import 'package:travel_trek/core/widgets/custom_app_bar.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const routeName = 'MainView';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  var currentindex = 0;
  late final UserTripInfoCubit _userTripInfoCubit;
  late final GetAllPlansCubit _getAllPlansCubit;

  @override
  void initState() {
    super.initState();
    final userToken = Prefs.getString(kUserToken);
    _userTripInfoCubit = UserTripInfoCubit(homeRepo: getIt<HomeRepo>());
    _getAllPlansCubit = GetAllPlansCubit(plansRepo: getIt<PlansRepo>());

    if (userToken.isNotEmpty) {
      _userTripInfoCubit.getUserTripInfo(token: userToken);
    }
  }

  @override
  void dispose() {
    _userTripInfoCubit.close();
    _getAllPlansCubit.close();
    super.dispose();
  }

  void _onTabTapped(int index) {
    final userToken = Prefs.getString(kUserToken);
    setState(() => currentindex = index);

    if (index == 0 && userToken.isNotEmpty) {
      _userTripInfoCubit.getUserTripInfo(token: userToken);
    } else if (index == 1 && userToken.isNotEmpty) {
      _getAllPlansCubit.getAllPlans(token: userToken);
    }
  }

  @override
  Widget build(BuildContext context) {
    final userEntity = Prefs.getUserEntity();
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _userTripInfoCubit),
        BlocProvider.value(value: _getAllPlansCubit),
      ],
      child: Scaffold(
        bottomNavigationBar: CustomBottomNavigationBar(
          onItemTapped: _onTabTapped,
        ),
        appBar: currentindex == 2
            ? null
            : customAppBar(name: userEntity?.name ?? 'NNNNN'),
        body: MainViewBody(currentindex: currentindex),
      ),
    );
  }
}
