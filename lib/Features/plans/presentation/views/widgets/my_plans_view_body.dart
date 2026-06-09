import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_trek/Features/home/data/models/plan_model/plan_model.dart';
import 'package:travel_trek/Features/plans/presentation/manger/cubit/get_all_plans_cubit.dart';
import 'package:travel_trek/Features/plans/presentation/views/widgets/build_header_widget.dart';
import 'package:travel_trek/Features/plans/presentation/views/widgets/build_plant_item_sliver_list_builder.dart';
import 'package:travel_trek/Features/plans/presentation/views/widgets/build_search_bar_widget.dart';
import 'package:travel_trek/core/helper_function/show_snack_bar.dart';
import 'package:travel_trek/core/widgets/app_modal_hud.dart';

class MyPlansViewBody extends StatefulWidget {
  const MyPlansViewBody({super.key});

  @override
  State<MyPlansViewBody> createState() => _MyPlansViewBodyState();
}

class _MyPlansViewBodyState extends State<MyPlansViewBody> {
  String _query = '';

  List<PlanModel> _filter(List<PlanModel> plans) {
    if (_query.trim().isEmpty) return plans;
    final q = _query.toLowerCase();
    return plans.where((p) {
      final city = p.value?.city?.toLowerCase() ?? '';
      final country = p.value?.country?.toLowerCase() ?? '';
      final prompt = p.value?.prompt?.toLowerCase() ?? '';
      return city.contains(q) || country.contains(q) || prompt.contains(q);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GetAllPlansCubit, GetAllPlansState>(
      listenWhen: (prev, curr) =>
          curr is GetAllPlansDeleteSuccess ||
          curr is GetAllPlansDeleteFailure ||
          curr is GetAllPlansFailure,
      listener: (context, state) {
        if (state is GetAllPlansDeleteSuccess) {
          showSuccessSnackBar(context, 'Plan deleted successfully');
        } else if (state is GetAllPlansDeleteFailure) {
          showErrorSnackBar(context, state.errorMessage);
        } else if (state is GetAllPlansFailure) {
          showErrorSnackBar(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        final isDeleting = state is GetAllPlansDeleteLoading;

        return AppModalHud(
          isLoading: isDeleting,
          message: 'Deleting plan',
          spinnerColor: const Color(0xFFB00020),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(),
              slivers: [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      const BuildHeaderWidget(),
                      const SizedBox(height: 16),
                      BuildSearchBarWidget(
                        onChanged: (value) {
                          setState(() => _query = value);
                        },
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),

                BlocBuilder<GetAllPlansCubit, GetAllPlansState>(
                  buildWhen: (prev, curr) =>
                      curr is GetAllPlansLoading ||
                      curr is GetAllPlansSuccess ||
                      curr is GetAllPlansFailure,
                  builder: (context, state) {
                    if (state is GetAllPlansLoading) {
                      return const SliverFillRemaining(
                        child: Center(
                          child: CircularProgressIndicator(
                            color: Color(0xff8B7E7A),
                            strokeWidth: 2.5,
                          ),
                        ),
                      );
                    } else if (state is GetAllPlansSuccess) {
                      final filtered = _filter(state.plans);
                      if (filtered.isEmpty) {
                        return SliverFillRemaining(
                          child: Center(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.search_off_rounded,
                                  size: 56,
                                  color: Colors.grey.shade300,
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  _query.isEmpty
                                      ? 'No plans yet'
                                      : 'No results for "$_query"',
                                  style: const TextStyle(
                                    fontSize: 15,
                                    color: Color(0xFF847577),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }
                      return BuildPlanItemsSliverListBuilder(plans: filtered);
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
          ),
        );
      },
    );
  }
}
