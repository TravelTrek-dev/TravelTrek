import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:travel_trek/Features/Budget/presentation/manger/cubit/expense_cubit.dart';
import 'package:travel_trek/Features/Budget/presentation/views/widgets/budget_header.dart';
import 'package:travel_trek/Features/home/data/models/plan_model/plan_model.dart';

class BuildBudgetHeader extends StatefulWidget {
  const BuildBudgetHeader({super.key, required this.planModel});
  final PlanModel planModel;
  @override
  State<BuildBudgetHeader> createState() => _BuildBudgetHeaderState();
}

class _BuildBudgetHeaderState extends State<BuildBudgetHeader> {
  double spentAmount = 0.0;
  double totalBudget = 0.0; // ملحوظة: يستحسن تمرر القيمة دي في الـ Constructor عشان الحسابات تظبط

  @override
  Widget build(BuildContext context) {
    double remaining = totalBudget - spentAmount;
    String spentAmountStr = NumberFormat('#,###.00').format(spentAmount);
    String remainingStr = NumberFormat('#,###.00').format(remaining);
    String totalBudgetStr = NumberFormat('#,###.00').format(totalBudget);
    double utilizedPercent = totalBudget > 0 ? spentAmount / totalBudget : 0;

    return BlocListener<ExpenseCubit, ExpenseState>(
      listener: (context, state) {
        if (state is GetExpenseHistorySuccess) {
          if (state.expenses.isNotEmpty) {
            spentAmount = state.expenses[0].spent?.toDouble() ?? 0.0;
            totalBudget = widget.planModel.value!.budget!.toDouble();
          } else {
            spentAmount = 0.0;
          }
          setState(() {});
        }
      },
      child: BudgetHeader(
        spentAmountStr: spentAmountStr,
        totalBudgetStr: totalBudgetStr,
        utilizedPercent: utilizedPercent,
        remainingStr: remainingStr, planModel:  widget.planModel,
      ),
    );
  }
}