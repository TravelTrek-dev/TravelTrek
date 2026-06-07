import 'package:flutter/material.dart';
import 'package:travel_trek/Features/Budget/presentation/views/add_expense_view.dart';
import 'package:travel_trek/Features/Budget/presentation/views/widgets/budget_progressbar.dart';
import 'package:travel_trek/Features/Budget/presentation/views/widgets/log_expense_button.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_trek/Features/Budget/presentation/manger/cubit/expense_cubit.dart';

class BudgetHeader extends StatelessWidget {
  const BudgetHeader({
    super.key,
    required this.spentAmountStr,
    required this.totalBudgetStr,
    required this.utilizedPercent,
    required this.remainingStr,
  });

  final String spentAmountStr;
  final String totalBudgetStr;
  final double utilizedPercent;
  final String remainingStr;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Header
        const Text(
          'Paris Getaway Budget',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1A1207),
            letterSpacing: -0.3,
          ),
        ),
        const SizedBox(height: 6),
        const Text(
          'May 12 – May 19, 2024',
          style: TextStyle(
            fontSize: 14,
            color: Color(0xFF7A6F5E),
            letterSpacing: 0.1,
          ),
        ),
        const SizedBox(height: 28),

        // Budget Card
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: const Color(0xFF4A4035).withOpacity(0.08),
                blurRadius: 20,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Row: Spent so far & Estimated Total
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'SPENT SO FAR',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF9E9183),
                          letterSpacing: 1.2,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        '\$$spentAmountStr',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A1207),
                          letterSpacing: -0.5,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'ESTIMATED TOTAL',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF9E9183),
                          letterSpacing: 1.2,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        '\$$totalBudgetStr',
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF1A1207),
                          letterSpacing: -0.3,
                        ),
                      ),
                    ],
                  ),
                ],
              ),

              const SizedBox(height: 24),

              BudgetProgressBar(progress: utilizedPercent),

              const SizedBox(height: 14),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 8,
                        height: 8,
                        decoration: const BoxDecoration(
                          color: Color(0xFF4A4035),
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 6),
                      Text(
                        '${(utilizedPercent * 100).toStringAsFixed(1)}% utilized',
                        style: TextStyle(
                          fontSize: 13,
                          color: Color(0xFF5C5347),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 5,
                    ),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF0EBE0),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '\$$remainingStr remaining',
                      style: TextStyle(
                        fontSize: 12,
                        color: Color(0xFF5C5347),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        SizedBox(height: 24),
        LogExpenseButton(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (ctx) => BlocProvider.value(
                  value: BlocProvider.of<ExpenseCubit>(context),
                  child: const AddExpenseView(),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
