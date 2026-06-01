import 'package:flutter/material.dart';
import 'package:travel_trek/Features/home/presentation/views/widgets/recent_plan_list_view_builder.dart';
import 'package:travel_trek/Features/home/presentation/views/widgets/trip_planner_input_field.dart';
import 'package:travel_trek/constants.dart';
import 'package:travel_trek/core/helper_function/show_snack_bar.dart';
import 'package:travel_trek/core/utils/app_styles.dart';
import 'package:travel_trek/core/widgets/custom_button.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  final TextEditingController _promptController = TextEditingController();

  @override
  void dispose() {
    _promptController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
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
            SizedBox(height: 180, child: RecentPlanListViewBuilder()),
            const SizedBox(height: 70),
            CustomButton(
              text: 'Generate My Plan',
              onPressed: () {
                final prompt = _promptController.text.trim();
                if (prompt.isNotEmpty) {
                  kRecentSearches.add(prompt);
                  _promptController.clear();
                  setState(() {});
                } else {
                  showSnackBar(
                    context,
                    'Please enter a description of your dream trip.',
                  );
                }
              },
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
