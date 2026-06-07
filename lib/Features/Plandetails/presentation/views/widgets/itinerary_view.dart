import 'package:flutter/material.dart';
import 'package:travel_trek/Features/Plandetails/presentation/views/widgets/local_currency_card.dart';
import 'package:travel_trek/Features/Plandetails/presentation/views/widgets/section_header.dart';
import 'package:travel_trek/Features/Plandetails/presentation/views/widgets/sliver_list_builder_day_card.dart';
import 'package:travel_trek/Features/Plandetails/presentation/views/widgets/sliver_list_builder_trivel_trip.dart';
import 'package:travel_trek/Features/Plandetails/presentation/views/widgets/sliver_plan_header.dart';
import 'package:travel_trek/core/widgets/custom_button.dart';

class ItineraryView extends StatelessWidget {
  const ItineraryView({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              SliverPlanHeader(),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SectionHeader(
                  title: 'Daily Itinerary',
                  action: 'Expand All',
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
        SliverListBuilderDayCard(),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                const LocalCurrencyCard(),
                const SizedBox(height: 24),

                const Text(
                  'Travel Tips',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
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
            child: CustomButton(text: 'Save Plan', onPressed: () {}),
          ),
        ),

        SliverToBoxAdapter(child: const SizedBox(height: 24)),
      ],
    );
  }
}
