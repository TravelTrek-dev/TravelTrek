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
    final generalAdvice = widget.planModel?.value?.generalAdvice;
    final packingTips = widget.planModel?.value?.packingTips;
    final hasTips =
        (generalAdvice != null && generalAdvice.isNotEmpty) ||
        (packingTips != null && packingTips.isNotEmpty);
    final currency = widget.planModel?.value?.currency;

    return CustomScrollView(
      slivers: [
        // Hero Image + Info Header
        SliverToBoxAdapter(
          child: Column(
            children: [
              SliverPlanHeader(planModel: widget.planModel),
              const SizedBox(height: 32),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SectionHeader(title: 'Daily Itinerary', action: null),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),

        // Day Cards (timeline)
        SliverListBuilderDayCard(days: widget.planModel?.value?.days),

        // Currency + Travel Tips
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 28),

                if (currency != null && currency.isNotEmpty)
                  LocalCurrencyCard(
                    userCurrency: widget.planModel?.value?.userCurrency ?? widget.planModel?.value?.currency ?? "USD",
                    currency: widget.planModel?.value?.currency ?? "USD",
                    conversionRate: widget.planModel?.value?.conversionRate ?? 1.0,
                  ),

                if (hasTips) ...[
                  const SizedBox(height: 28),
                  const SectionHeader(title: 'Travel Tips'),
                  const SizedBox(height: 16),

                  if (generalAdvice != null && generalAdvice.isNotEmpty)
                    _TipCard(
                      icon: Icons.lightbulb_outline_rounded,
                      text: generalAdvice,
                    ),

                  // Packing Tips
                  if (packingTips != null && packingTips.isNotEmpty) ...[
                    const SizedBox(height: 12),
                    _PackingTipsCard(tips: packingTips),
                  ],
                ],

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),

        // Save Plan Button
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
                              userToken: Prefs.getString(kUserAccessToken),
                            );
                          },
                  );
                },
              ),
            ),
          ),

        const SliverToBoxAdapter(child: SizedBox(height: 32)),
      ],
    );
  }
}

// ─── Tip Card ─────────────────────────────────────────────────────────────────

class _TipCard extends StatelessWidget {
  const _TipCard({required this.icon, required this.text});

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xFFF5F3EE),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE8E4DC), width: 1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: const Color(0xFF66595B).withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: const Color(0xFF66595B), size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF4A4040),
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─── Packing Tips Card ────────────────────────────────────────────────────────

class _PackingTipsCard extends StatelessWidget {
  const _PackingTipsCard({required this.tips});

  final List<String> tips;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 12,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.luggage_outlined, size: 18, color: Color(0xFF66595B)),
              SizedBox(width: 8),
              Text(
                'Packing Tips',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF2C2829),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...tips.map(
            (tip) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Icon(
                      Icons.check_circle_outline,
                      size: 16,
                      color: Color(0xFF66595B),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      tip,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF5C5050),
                        height: 1.5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
