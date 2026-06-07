import 'package:flutter/material.dart';
import 'package:travel_trek/Features/Budget/domain/entites/expense_entity.dart';
import 'package:travel_trek/Features/Budget/presentation/views/widgets/expense_category_card.dart';

class ExpenseSummarySection extends StatelessWidget {
  const ExpenseSummarySection({super.key, required this.expenses});

  final List<ExpenseEntity> expenses;

  @override
  Widget build(BuildContext context) {
    if (expenses.isEmpty) {
      return const Center(
        child: Text(
          'No expenses yet',
          style: TextStyle(fontSize: 14, color: Color(0xFF7A6F5E)),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: expenses.length,
      itemBuilder: (context, index) {
        final e = expenses[index];
        return Column(
          children: [
            ExpenseCategoryCard(
              category: e.category,
              description: e.description,
              amount: e.price.toDouble(),
            ),
            if (index != expenses.length - 1) const SizedBox(height: 16),
          ],
        );
      },
    );
  }
}
