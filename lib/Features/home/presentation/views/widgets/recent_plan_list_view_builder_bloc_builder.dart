import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_trek/Features/home/presentation/views/widgets/recent_plan_list_view_builder.dart';
import 'package:travel_trek/core/cubits/cubit/user_trip_info_cubit.dart';

class RecentPlanListViewBuilderBlocBuilder extends StatefulWidget {
  const RecentPlanListViewBuilderBlocBuilder({super.key});

  @override
  State<RecentPlanListViewBuilderBlocBuilder> createState() =>
      _RecentPlanListViewBuilderBlocBuilderState();
}

class _RecentPlanListViewBuilderBlocBuilderState
    extends State<RecentPlanListViewBuilderBlocBuilder> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<UserTripInfoCubit, UserTripInfoState>(
      listener: (context, state) {
        if (state is UserTripInfoFailure) {
          log(state.errorMessage);
        }
      },
      builder: (context, state) {
        final prompts = state is UserTripInfoSuccess
            ? state.userTripInfo.value?.prompts
                      ?.map((e) => e.prompt)
                      .whereType<String>()
                      .toList() ??
                  []
            : <String>[];

        return RecentPlanListViewBuilder(prompts: prompts);
      },
    );
  }
}
