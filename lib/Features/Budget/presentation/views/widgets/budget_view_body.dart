import 'package:flutter/material.dart';
import 'package:travel_trek/Features/Budget/presentation/views/widgets/build_budget_header.dart';
import 'package:travel_trek/Features/Budget/presentation/views/widgets/expense_summary_section.dart';

class BudgetViewBody extends StatelessWidget {
  const BudgetViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BuildBudgetHeader(),
            const SizedBox(height: 32),
            const Text(
              'Expense Categories',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: Color(0xff1A1C17),
              ),
            ),
            const SizedBox(height: 16),
            const ExpenseSummarySection(),
          ],
        ),
      ),
    );
  }
}
