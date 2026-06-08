import 'package:flutter/material.dart';
import 'package:travel_trek/Features/home/data/models/plan_model/day.dart';

class DayCard extends StatelessWidget {
  const DayCard({super.key, required this.day, required this.index});

  final Day? day;
  final int index;

  @override
  Widget build(BuildContext context) {
    final dayNumber = day?.dayNumber ?? index + 1;
    final title = day?.activities?.isNotEmpty == true
        ? 'Day $dayNumber: ${day!.activities!.first.name ?? 'Activity'}'
        : 'Day $dayNumber';
    final description = day?.activities?.first.description ??
        'No itinerary details available for this day.';
    final meals = day?.meals;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Container(
                height: 30,
                alignment: Alignment.center,
                child: Container(
                  height: 15,
                  width: 15,
                  decoration: const BoxDecoration(
                    color: Color(0xFF66595B),
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              Expanded(
                child: VerticalDivider(
                  thickness: 2,
                  width: 2,
                  color: const Color(0xFF66595B).withOpacity(0.2),
                ),
              ),
            ],
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    title.split(' ').take(5).join(' '),
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF66595B),
                      height: 1.2,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2F2EE),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        description,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFF66595B),
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 16),
                      if (meals != null) ...[
                        if (meals.breakfast != null)
                          _buildMealLine('Breakfast', meals.breakfast!),
                        if (meals.lunch != null)
                          _buildMealLine('Lunch', meals.lunch!),
                        if (meals.dinner != null)
                          _buildMealLine('Dinner', meals.dinner!),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 30),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMealLine(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Text(
            '$label: ',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Color(0xFF66595B),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF66595B),
                height: 1.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
