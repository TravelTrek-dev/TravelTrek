import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_trek/Features/plans/domain/repos/plans_repo.dart';
import 'package:travel_trek/Features/plans/presentation/manger/cubit/get_all_plans_cubit.dart';
import 'package:travel_trek/Features/plans/presentation/views/widgets/my_plans_view_body.dart';
import 'package:travel_trek/constants.dart';
import 'package:travel_trek/core/services/prefs.dart';
import 'package:travel_trek/core/services/service_locator.dart';

class PlansView extends StatefulWidget {
  const PlansView({super.key});

  @override
  State<PlansView> createState() => _PlansViewState();
}

class _PlansViewState extends State<PlansView> {
  late GetAllPlansCubit _cubit;

  @override
  void initState() {
    super.initState();
    String userToken = Prefs.getString(kUserToken);
    _cubit = GetAllPlansCubit(plansRepo: getIt<PlansRepo>())
      ..getAllPlans(token: userToken);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider.value(
        value: _cubit,
        child: const MyPlansViewBody(),
      ),
    );
  }

  @override
  void dispose() {
    _cubit.close();
    super.dispose();
  }
}
