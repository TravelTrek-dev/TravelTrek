import 'package:flutter/material.dart';
import 'package:travel_trek/Features/day_details/presentation/views/widgets/build_Local_lnsight.dart';
import 'package:travel_trek/Features/day_details/presentation/views/widgets/build_action_row.dart';
import 'package:travel_trek/Features/day_details/presentation/views/widgets/build_description.dart';
import 'package:travel_trek/Features/day_details/presentation/views/widgets/build_duration.dart';
import 'package:travel_trek/Features/day_details/presentation/views/widgets/build_header.dart';

class DayDetailsCard extends StatelessWidget {
  const DayDetailsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: Color(0xFFFFFFFF),
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Left Accent Border
            Container(width: 5, color: Color(0xFF6B6363).withOpacity(0.6)),
            // Main Card Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildHeader(),
                    const SizedBox(height: 16),
                    buildDuration(),
                    const SizedBox(height: 12),
                    buildDescription(),
                    const SizedBox(height: 16),
                    buildActionRow(),
                    const SizedBox(height: 20),
                    buildLocalInsight(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


