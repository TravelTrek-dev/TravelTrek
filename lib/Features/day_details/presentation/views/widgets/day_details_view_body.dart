import 'package:flutter/material.dart';
import 'package:travel_trek/Features/home/data/models/plan_model/day.dart';
import 'package:travel_trek/Features/home/data/models/plan_model/plan_model.dart';

class DayDetailsViewBody extends StatefulWidget {
  const DayDetailsViewBody({super.key, this.planModel});
  final PlanModel? planModel;

  @override
  State<DayDetailsViewBody> createState() => _DayDetailsViewBodyState();
}

class _DayDetailsViewBodyState extends State<DayDetailsViewBody> {
  int _selectedDayIndex = 0;

  List<Day> get _days => widget.planModel?.value?.days ?? [];

  @override
  Widget build(BuildContext context) {
    if (_days.isEmpty) {
      return const Center(
        child: Text(
          'No day details available',
          style: TextStyle(color: Color(0xFF847577), fontSize: 16),
        ),
      );
    }

    final selectedDay = _days[_selectedDayIndex];

    return Column(
      children: [
        // Day Selector Horizontal Strip
        _DaySelector(
          days: _days,
          selectedIndex: _selectedDayIndex,
          onDaySelected: (i) => setState(() => _selectedDayIndex = i),
        ),
        // Day Activities List
        Expanded(
          child: _DayActivitiesList(
            day: selectedDay,
            city: widget.planModel?.value?.city ?? '',
          ),
        ),
      ],
    );
  }
}

// ─── Day Selector ────────────────────────────────────────────────────────────

class _DaySelector extends StatelessWidget {
  const _DaySelector({
    required this.days,
    required this.selectedIndex,
    required this.onDaySelected,
  });

  final List<Day> days;
  final int selectedIndex;
  final ValueChanged<int> onDaySelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      height: 58,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        itemCount: days.length,
        itemBuilder: (context, i) {
          final isSelected = i == selectedIndex;
          return GestureDetector(
            onTap: () => onDaySelected(i),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              margin: const EdgeInsets.only(right: 8),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xFF66595B)
                    : const Color(0xFFF2F0ED),
                borderRadius: BorderRadius.circular(24),
              ),
              child: Text(
                'Day ${days[i].dayNumber ?? i + 1}',
                style: TextStyle(
                  color: isSelected ? Colors.white : const Color(0xFF847577),
                  fontWeight:
                      isSelected ? FontWeight.w700 : FontWeight.w500,
                  fontSize: 13,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// ─── Day Activities List ─────────────────────────────────────────────────────

class _DayActivitiesList extends StatelessWidget {
  const _DayActivitiesList({required this.day, required this.city});

  final Day day;
  final String city;

  @override
  Widget build(BuildContext context) {
    final activities = day.activities ?? [];
    final meals = day.meals;

    return CustomScrollView(
      slivers: [
        // Header
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 8),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(
                    color: Color(0xFF66595B),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '${day.dayNumber ?? 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Day ${day.dayNumber ?? 1}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2C2829),
                      ),
                    ),
                    if (city.isNotEmpty)
                      Text(
                        city,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF847577),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ),

        // Activities
        if (activities.isEmpty)
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.all(24),
              child: Text(
                'No activities planned for this day.',
                style: TextStyle(color: Color(0xFF847577), fontSize: 15),
              ),
            ),
          )
        else
          SliverList.builder(
            itemCount: activities.length,
            itemBuilder: (context, index) {
              final activity = activities[index];
              final isLast = index == activities.length - 1;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: _ActivityTimelineCard(
                  activity: activity,
                  index: index,
                  isLast: isLast,
                ),
              );
            },
          ),

        // Meals Section
        if (meals != null &&
            (meals.breakfast != null ||
                meals.lunch != null ||
                meals.dinner != null))
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
              child: _MealsCard(meals: meals),
            ),
          ),

        const SliverToBoxAdapter(child: SizedBox(height: 32)),
      ],
    );
  }
}

// ─── Activity Timeline Card ──────────────────────────────────────────────────

class _ActivityTimelineCard extends StatelessWidget {
  const _ActivityTimelineCard({
    required this.activity,
    required this.index,
    required this.isLast,
  });

  final dynamic activity;
  final int index;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final hasImage =
        activity.imageUrl != null && activity.imageUrl!.isNotEmpty;
    final hasCost =
        activity.approximateCost != null &&
        activity.approximateCost!.isNotEmpty;
    final hasMapLink =
        activity.googleMapsLink != null &&
        activity.googleMapsLink!.isNotEmpty;
    final hasType = activity.type != null && activity.type!.isNotEmpty;

    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Timeline indicator
          SizedBox(
            width: 32,
            child: Column(
              children: [
                Container(
                  width: 28,
                  height: 28,
                  decoration: BoxDecoration(
                    color: const Color(0xFF66595B),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFF66595B).withValues(alpha: 0.3),
                        blurRadius: 6,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      '${index + 1}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: const Color(0xFF66595B).withValues(alpha: 0.18),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 12),

          // Card
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withValues(alpha: 0.05),
                    blurRadius: 16,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Image
                  if (hasImage)
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(18),
                      ),
                      child: Image.network(
                        activity.imageUrl!,
                        height: 160,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stack) => Container(
                          height: 160,
                          color: const Color(0xFFF2F0ED),
                          child: const Icon(
                            Icons.image_not_supported_outlined,
                            color: Color(0xFF847577),
                            size: 40,
                          ),
                        ),
                      ),
                    ),

                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Type badge
                        if (hasType)
                          Container(
                            margin: const EdgeInsets.only(bottom: 8),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10,
                              vertical: 3,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xFFF2F0ED),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              activity.type!.toUpperCase(),
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF847577),
                                letterSpacing: 0.8,
                              ),
                            ),
                          ),

                        // Name
                        Text(
                          activity.name ?? 'Activity',
                          style: const TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF2C2829),
                            height: 1.3,
                          ),
                        ),

                        // Description
                        if (activity.description != null &&
                            activity.description!.isNotEmpty) ...[
                          const SizedBox(height: 8),
                          Text(
                            activity.description!,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF6B6363),
                              height: 1.5,
                            ),
                          ),
                        ],

                        const SizedBox(height: 12),

                        // Cost + Map row
                        Row(
                          children: [
                            if (hasCost) ...[
                              const Icon(
                                Icons.attach_money_rounded,
                                size: 16,
                                color: Color(0xFF66595B),
                              ),
                              const SizedBox(width: 4),
                              Text(
                                activity.approximateCost!,
                                style: const TextStyle(
                                  fontSize: 13,
                                  color: Color(0xFF66595B),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(width: 16),
                            ],
                            if (hasMapLink)
                              GestureDetector(
                                onTap: () {
                                  // Could open google maps URL
                                },
                                child: const Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Icon(
                                      Icons.map_outlined,
                                      size: 16,
                                      color: Color(0xFF66595B),
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      'View on Maps',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Color(0xFF66595B),
                                        fontWeight: FontWeight.w600,
                                        decoration: TextDecoration.underline,
                                        decorationColor: Color(0xFF66595B),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ],
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

// ─── Meals Card ──────────────────────────────────────────────────────────────

class _MealsCard extends StatelessWidget {
  const _MealsCard({required this.meals});

  final dynamic meals;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 16,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Icon(Icons.restaurant_outlined, size: 18, color: Color(0xFF66595B)),
              SizedBox(width: 8),
              Text(
                'Meals',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2C2829),
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          if (meals.breakfast != null) _mealRow('🌅', 'Breakfast', meals.breakfast!),
          if (meals.lunch != null) _mealRow('☀️', 'Lunch', meals.lunch!),
          if (meals.dinner != null) _mealRow('🌙', 'Dinner', meals.dinner!),
        ],
      ),
    );
  }

  Widget _mealRow(String emoji, String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emoji, style: const TextStyle(fontSize: 16)),
          const SizedBox(width: 8),
          Text(
            '$label: ',
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Color(0xFF66595B),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF6B6363),
                height: 1.4,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
