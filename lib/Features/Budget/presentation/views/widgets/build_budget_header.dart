
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:travel_trek/Features/Budget/presentation/manger/cubit/expense_cubit.dart';
import 'package:travel_trek/Features/Budget/presentation/views/widgets/budget_header.dart';

class BuildBudgetHeader extends StatefulWidget {
  const BuildBudgetHeader({super.key});

  @override
  State<BuildBudgetHeader> createState() => _BuildBudgetHeaderState();
}

class _BuildBudgetHeaderState extends State<BuildBudgetHeader> {
  late double spentAmount = 0.0; 
   double totalBudget = 200000000.0; 

  @override
  Widget build(BuildContext context) {
   late double remaining  = totalBudget - spentAmount;
    String spentAmountStr = NumberFormat('#,###.00').format(spentAmount);
    String remainingStr = NumberFormat('#,###.00').format(remaining);
    String totalBudgetStr = NumberFormat('#,###.00').format(totalBudget);
    double utilizedPercent = totalBudget > 0 ? spentAmount / totalBudget : 0;

    return BlocListener<ExpenseCubit, ExpenseState>(
      listener: (context, state) {
        if (state is GetExpenseHistorySuccess) {
         spentAmount = state.expenses[0].spent!.toDouble() ;
         setState(() {});
        }
      },
      child: BudgetHeader(
        spentAmountStr: spentAmountStr,
        totalBudgetStr: totalBudgetStr,
        utilizedPercent: utilizedPercent,
        remainingStr: remainingStr,
      ),
    );
  }
}
