import 'package:flutter/material.dart';
import 'package:travel_trek/Features/home/data/models/plan_model/day.dart';

class DayCard extends StatelessWidget {
  const DayCard({super.key, required this.day, required this.index});

  final Day? day;
  final int index;

  @override
  Widget build(BuildContext context) {
    final dayNumber = day?.dayNumber ?? index + 1;
    final activities = day?.activities ?? [];
    final meals = day?.meals;

    // Build a summary: first activity name + total activities count
    final firstActivityName = activities.isNotEmpty
        ? (activities.first.name ?? 'Activity')
        : null;
    final activitySummary = activities.length > 1
        ? '$firstActivityName  +${activities.length - 1} more'
        : firstActivityName ?? 'No activities planned';

    final description = activities.isNotEmpty
        ? (activities.first.description ?? '')
        : 'No itinerary details available for this day.';

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline column
          SizedBox(
            width: 40,
            child: Column(
              children: [
                // Circle dot
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: const Color(0xFF66595B),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF66595B).withValues(alpha: 0.25),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      '$dayNumber',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
                // Connecting line
                Expanded(
                  child: Container(
                    width: 2,
                    color: const Color(0xFF66595B).withValues(alpha: 0.15),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),

          // Card content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Day label
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    'Day $dayNumber',
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: Color(0xFF847577),
                      letterSpacing: 0.6,
                    ),
                  ),
                ),
                const SizedBox(height: 4),

                // Activity title
                Text(
                  activitySummary,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF2C2829),
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 12),

                // Content card
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF8F7F4),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: const Color(0xFFE8E4DC),
                      width: 1,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Hero image of first activity
                      if (activities.isNotEmpty &&
                          activities.first.imageUrl != null &&
                          activities.first.imageUrl!.isNotEmpty)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            activities.first.imageUrl!,
                            height: 120,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stack) => const SizedBox.shrink(),
                          ),
                        ),
                      if (activities.isNotEmpty &&
                          activities.first.imageUrl != null &&
                          activities.first.imageUrl!.isNotEmpty)
                        const SizedBox(height: 12),

                      // Description
                      Text(
                        description.length > 160
                            ? '${description.substring(0, 160)}…'
                            : description,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF6B6363),
                          height: 1.55,
                        ),
                      ),

                      // Meals summary
                      if (meals != null) ...[
                        const SizedBox(height: 12),
                        const Divider(color: Color(0xFFE8E4DC), height: 1),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            const Icon(
                              Icons.restaurant_outlined,
                              size: 14,
                              color: Color(0xFF847577),
                            ),
                            const SizedBox(width: 6),
                            Text(
                              _buildMealSummary(meals),
                              style: const TextStyle(
                                fontSize: 13,
                                color: Color(0xFF847577),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],

                      // Activity count chips
                      if (activities.length > 1) ...[
                        const SizedBox(height: 12),
                        Wrap(
                          spacing: 6,
                          runSpacing: 6,
                          children: activities
                              .skip(1)
                              .take(3)
                              .map(
                                (a) => Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFEDE9E4),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Text(
                                    a.name ?? 'Activity',
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Color(0xFF66595B),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              )
                              .toList(),
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _buildMealSummary(dynamic meals) {
    final parts = <String>[];
    if (meals.breakfast != null) parts.add('Breakfast');
    if (meals.lunch != null) parts.add('Lunch');
    if (meals.dinner != null) parts.add('Dinner');
    return parts.join(' · ');
  }
}
