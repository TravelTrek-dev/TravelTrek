import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_trek/Features/Plandetails/presentation/views/widgets/local_currency_card.dart';
import 'package:travel_trek/Features/Plandetails/presentation/views/widgets/section_header.dart';
import 'package:travel_trek/Features/Plandetails/presentation/views/widgets/sliver_list_builder_day_card.dart';
import 'package:travel_trek/Features/Plandetails/presentation/views/widgets/sliver_list_builder_trivel_trip.dart';
import 'package:travel_trek/Features/Plandetails/presentation/views/widgets/sliver_plan_header.dart';
import 'package:travel_trek/Features/Plandetails/presentation/manger/cubits/plan_details_cubit.dart';
import 'package:travel_trek/Features/home/data/models/plan_model/plan_model.dart';
import 'package:travel_trek/core/services/prefs.dart';
import 'package:travel_trek/constants.dart';
import 'package:travel_trek/core/widgets/custom_button.dart';

class ItineraryView extends StatelessWidget {
  const ItineraryView({super.key, required this.planModel});

  final PlanModel? planModel;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              SliverPlanHeader(planModel: planModel),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SectionHeader(
                  title: 'Daily Itinerary',
                  action: 'View All Details',
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
        SliverListBuilderDayCard(days: planModel?.value?.days),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                LocalCurrencyCard(userCurrency: planModel!.value!.currency!),
                const SizedBox(height: 24),
                const Text(
                  'Travel Tips',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 16),
                if (planModel?.value?.generalAdvice != null)
                  Text(
                    planModel!.value!.generalAdvice!,
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  ),
                if (planModel?.value?.packingTips != null)
                  ...planModel!.value!.packingTips!.map(
                    (tip) => Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: Text(
                        '• $tip',
                        style: const TextStyle(fontSize: 16, height: 1.5),
                      ),
                    ),
                  ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ),
        SliverListBuilderTrivelTrip(),
        SliverToBoxAdapter(child: const SizedBox(height: 24)),

        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: CustomButton(
              text: 'Save Plan',
              onPressed: () {
                if (planModel == null) return;
                BlocProvider.of<PlanDetailsCubit>(context).savePlan(
                  planModel: planModel!,
                  userToken: Prefs.getString(kUserToken),
                );
              },
            ),
          ),
        ),

        SliverToBoxAdapter(child: const SizedBox(height: 24)),
      ],
    );
  }
}
