import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:travel_trek/Features/Budget/presentation/views/widgets/budget_header.dart';

class BuildBudgetHeader extends StatelessWidget {
  const BuildBudgetHeader({super.key});

  final double spentAmount = 1400;
  final double totalBudget = 2500.00;

  @override
  Widget build(BuildContext context) {
    double remaining = totalBudget - spentAmount;
    String spentAmountStr = NumberFormat('#,###.00').format(spentAmount);
    String remainingStr = NumberFormat('#,###.00').format(remaining);
    String totalBudgetStr = NumberFormat('#,###.00').format(totalBudget);
    double utilizedPercent = totalBudget > 0 ? spentAmount / totalBudget : 0;

    return BudgetHeader(
      spentAmountStr: spentAmountStr,
      totalBudgetStr: totalBudgetStr,
      utilizedPercent: utilizedPercent,
      remainingStr: remainingStr,
    );
  }
}