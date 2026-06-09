import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_trek/Features/plans/presentation/manger/cubit/get_all_plans_cubit.dart';
import 'package:travel_trek/Features/plans/presentation/views/widgets/my_plans_view_body.dart';

class PlansView extends StatelessWidget {
  const PlansView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<GetAllPlansCubit>(),
      child: const Scaffold(
        body: MyPlansViewBody(),
      ),
    );
  }
}
