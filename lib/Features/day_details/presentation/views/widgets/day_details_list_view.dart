import 'package:flutter/material.dart';
import 'package:travel_trek/Features/day_details/presentation/views/widgets/day_card.dart';

class DayDetailsSliverList extends StatelessWidget {
  const DayDetailsSliverList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
        child: DayDetailsCard(),
      ),
      itemCount: 5,
    );
  }
}
