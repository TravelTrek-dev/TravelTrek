import 'package:flutter/material.dart';
import 'package:travel_trek/Features/day_details/presentation/views/widgets/day_details_list_view.dart';

class DayDetailsViewBody extends StatelessWidget {
  const DayDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              children: [
                SizedBox(height: 24),
                Row(
                  children: [
                    Text(
                      'Day 1',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
                SizedBox(height: 12),
               
              ],
            ),
          ),
        ),
         DayDetailsSliverList(),

         SliverToBoxAdapter(
          child: SizedBox(height: 24),
         )
      ],
    );
  }
}
