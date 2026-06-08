import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_trek/Features/plans/presentation/manger/cubit/get_all_plans_cubit.dart';
import 'package:travel_trek/Features/plans/presentation/views/widgets/build_header_widget.dart';
import 'package:travel_trek/Features/plans/presentation/views/widgets/build_plant_item_sliver_list_builder.dart';
import 'package:travel_trek/Features/plans/presentation/views/widgets/build_search_bar_widget.dart';
import 'package:travel_trek/core/helper_function/show_snack_bar.dart';

class MyPlansViewBody extends StatelessWidget {
  const MyPlansViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: const [
                BuildHeaderWidget(),
                SizedBox(height: 16),
                BuildSearchBarWidget(),
                SizedBox(height: 32),
              ],
            ),
          ),

          BlocConsumer<GetAllPlansCubit, GetAllPlansState>(
            listener: (context, state) {
              if (state is GetAllPlansFailure) {
                showSnackBar(context, state.errorMessage);
              }
            },
            builder: (context, state) {
              if (state is GetAllPlansLoading) {
                return const SliverFillRemaining(
                  child: Center(child: CircularProgressIndicator()),
                );
              } else if (state is GetAllPlansSuccess) {
                return BuildPlanItemsSliverListBuilder(plans: state.plans);
              } else if (state is GetAllPlansFailure) {
                return SliverFillRemaining(
                  child: Center(child: Text(state.errorMessage)),
                );
              } else {
                return const SliverFillRemaining(
                  child: Center(child: Text('No data')),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
