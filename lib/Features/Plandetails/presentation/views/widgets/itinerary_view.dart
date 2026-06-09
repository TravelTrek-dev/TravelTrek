import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_trek/Features/Plandetails/presentation/views/widgets/local_currency_card.dart';
import 'package:travel_trek/Features/Plandetails/presentation/views/widgets/section_header.dart';
import 'package:travel_trek/Features/Plandetails/presentation/views/widgets/sliver_list_builder_day_card.dart';
import 'package:travel_trek/Features/Plandetails/presentation/views/widgets/sliver_plan_header.dart';
import 'package:travel_trek/Features/Plandetails/presentation/manger/cubits/plan_details_cubit.dart';
import 'package:travel_trek/Features/home/data/models/plan_model/plan_model.dart';
import 'package:travel_trek/core/services/prefs.dart';
import 'package:travel_trek/constants.dart';
import 'package:travel_trek/core/widgets/custom_button.dart';

class ItineraryView extends StatefulWidget {
  const ItineraryView({
    super.key,
    required this.planModel,
    this.showSaveButton = false,
  });

  final PlanModel? planModel;

  final bool showSaveButton;

  @override
  State<ItineraryView> createState() => _ItineraryViewState();
}

class _ItineraryViewState extends State<ItineraryView> {
  bool _planSaved = false;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            children: [
              SliverPlanHeader(planModel: widget.planModel),
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
        SliverListBuilderDayCard(days: widget.planModel?.value?.days),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 24),
                LocalCurrencyCard(
                    userCurrency: widget.planModel!.value!.currency!),
                const SizedBox(height: 24),
                const Text(
                  'Travel Tips',
                  style:
                      TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                const SizedBox(height: 16),
                if (widget.planModel?.value?.generalAdvice != null)
                  Text(
                    widget.planModel!.value!.generalAdvice!,
                    style: const TextStyle(fontSize: 16, height: 1.5),
                  ),
                if (widget.planModel?.value?.packingTips != null)
                  ...widget.planModel!.value!.packingTips!.map(
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
        SliverToBoxAdapter(child: const SizedBox(height: 24)),

        if (widget.showSaveButton && !_planSaved)
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: BlocConsumer<PlanDetailsCubit, PlanDetailsState>(
                listener: (context, state) {
                  if (state is PlanDetailsSuccess) {
                    setState(() => _planSaved = true);
                  }
                },
                builder: (context, state) {
                  final isSaving = state is PlanDetailsLoading;
                  return CustomButton(
                    text: isSaving ? 'Saving…' : 'Save Plan',
                    onPressed: isSaving
                        ? () {}
                        : () {
                            if (widget.planModel == null) return;
                            BlocProvider.of<PlanDetailsCubit>(context).savePlan(
                              planModel: widget.planModel!,
                              userToken: Prefs.getString(kUserToken),
                            );
                          },
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
