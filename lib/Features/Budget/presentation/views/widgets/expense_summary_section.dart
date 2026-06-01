import 'package:flutter/material.dart';
import 'package:travel_trek/Features/Budget/presentation/views/widgets/expense_category_card.dart';

class ExpenseSummarySection extends StatelessWidget {
  const ExpenseSummarySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ExpenseCategoryCard(
        category: 'Flights',
        description: 'Round-trip flight from New York to Paris',
        amount: 1200.00,
      ),
      const SizedBox(height: 16),
      ExpenseCategoryCard(
        category: 'Accommodation',
        description: 'Le Marais Boutique Hotel',
        amount: 800.00,
      ),
      const SizedBox(height: 16),
      ExpenseCategoryCard(
        category: 'Food & Dining',
        description: 'Daily Meals & Cafes',
        amount: 120.00,
      ),
      const SizedBox(height: 16),
      ExpenseCategoryCard(
        category: 'Activities',
        description: 'Museums, tours, and entertainment',
        amount: 200.00,
      ),
    ],);
  }
}