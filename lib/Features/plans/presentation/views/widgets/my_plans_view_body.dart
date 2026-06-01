import 'package:flutter/material.dart';
import 'package:travel_trek/Features/plans/presentation/views/widgets/build_header_widget.dart';
import 'package:travel_trek/Features/plans/presentation/views/widgets/build_plant_item_sliver_list_builder.dart';
import 'package:travel_trek/Features/plans/presentation/views/widgets/build_search_bar_widget.dart';

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
          
          const BuildPlanItemsSliverListBuilder(),
        ],
      ),
    );
  }
}

