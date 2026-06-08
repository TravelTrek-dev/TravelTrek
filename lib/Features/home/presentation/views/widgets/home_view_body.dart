import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_trek/Features/Plandetails/domain/repos/plan_repo.dart';
import 'package:travel_trek/Features/Plandetails/presentation/views/widgets/itinerary_view.dart';
import 'package:travel_trek/Features/Plandetails/presentation/manger/cubits/plan_details_cubit.dart';
import 'package:travel_trek/Features/home/presentation/manger/generate_plan/generate_plan_cubit_cubit.dart';
import 'package:travel_trek/Features/home/presentation/views/widgets/recent_plan_list_view_builder_bloc_builder.dart';
import 'package:travel_trek/Features/home/presentation/views/widgets/trip_planner_input_field.dart';
import 'package:travel_trek/constants.dart';
import 'package:travel_trek/core/services/prefs.dart';
import 'package:travel_trek/core/services/service_locator.dart';

import 'package:travel_trek/core/utils/app_styles.dart';
import 'package:travel_trek/core/widgets/custom_button.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final TextEditingController _promptController = TextEditingController();
  final userToken = Prefs.getString(kUserToken);

  @override
  void dispose() {
    _promptController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<GeneratePlanCubitCubit, GeneratePlanCubitState>(
      listener: (context, state) {
        if (state is GeneratePlanCubitSuccess) {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => BlocProvider(
                create: (_) => PlanDetailsCubit(planRepo: getIt<PlanRepo>()),
                child: BlocListener<PlanDetailsCubit, PlanDetailsState>(
                  listener: (context, planState) {
                    if (planState is PlanDetailsSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Plan saved successfully')),
                      );
                    } else if (planState is PlanDetailsFailure) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(planState.errorMessage)),
                      );
                    }
                  },
                  child: Scaffold(
                    body: ItineraryView(planModel: state.planModel),
                  ),
                ),
              ),
            ),
          );
        } else if (state is GeneratePlanCubitFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(state.errorMessage)),
          );
        }
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 32),
              Text(
                'Describe Your Dream Trip',
                style: AppStyles.bold26.copyWith(color: const Color(0xff2D2A2A)),
              ),
              const SizedBox(height: 3),
              Text(
                'Just one sentence — we\'ll handle the rest.',
                style: AppStyles.regluar16.copyWith(
                  color: const Color(0xff4A4646),
                ),
              ),
              const SizedBox(height: 40),
              TripPlannerInputField(
                controller: _promptController,
                onChanged: (_) {},
              ),
              const SizedBox(height: 16),
              const Text(
                'RECENT',
                style: TextStyle(
                  color: Color(0xFF847577),
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(height: 180, child: RecentPlanListViewBuilderBlocBuilder()),
              const SizedBox(height: 70),
              CustomButton(
                text: 'Generate My Plan',
                onPressed: () {
                  log('User Token: $userToken');
                  BlocProvider.of<GeneratePlanCubitCubit>(context).generatePlan(
                    userToken: userToken,
                    promot: _promptController.text.trim(),
                  );
                },
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
