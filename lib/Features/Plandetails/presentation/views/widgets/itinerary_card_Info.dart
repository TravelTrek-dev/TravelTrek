import 'package:flutter/material.dart';
import 'package:travel_trek/Features/Plandetails/presentation/views/widgets/build_detail_chip.dart';
import 'package:travel_trek/Features/home/data/models/plan_model/plan_model.dart';

class ItineraryCardInfo extends StatelessWidget {
  const ItineraryCardInfo({super.key, required this.planModel});

  final PlanModel? planModel;

  @override
  Widget build(BuildContext context) {
    final budget = planModel?.value?.budget;
    final groupSize = planModel?.value?.groupSize ?? 'N/A';
    final duration = planModel?.value?.duration;
    final dateRange = _buildDateRange(duration);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        height: 118,
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFFEEEEE6),
          borderRadius: BorderRadius.circular(18),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              buildDetailChip(
                Icons.money,
                budget != null
                    ? '${budget} ${planModel?.value?.currency ?? ''}'
                    : 'Budget not set',
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  buildDetailChip(Icons.people, '$groupSize Travelers'),
                  const SizedBox(width: 12),
                  buildDetailChip(Icons.date_range, dateRange),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _buildDateRange(String? duration) {
    if (duration == null || duration.isEmpty) {
      return 'Date range unknown';
    }

    final parts = duration.split(' ');
    final days = int.tryParse(parts.first) ?? 0;
    if (days <= 0) {
      return 'Date range unknown';
    }

    final startDate = DateTime.now();
    final endDate = startDate.add(Duration(days: days));
    return '${startDate.month}/${startDate.day} - ${endDate.month}/${endDate.day}';
  }
}
