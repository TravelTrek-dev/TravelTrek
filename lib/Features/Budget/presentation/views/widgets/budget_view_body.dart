import 'package:flutter/material.dart';
import 'package:travel_trek/Features/Budget/presentation/views/widgets/build_budget_header.dart';
import 'package:travel_trek/Features/Budget/presentation/views/widgets/expense_summary_section.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_trek/Features/Budget/presentation/manger/cubit/expense_cubit.dart';
import 'package:travel_trek/Features/home/data/models/plan_model/plan_model.dart';

class BudgetViewBody extends StatelessWidget {
  const BudgetViewBody({super.key, required this.planModel});
  final PlanModel planModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             BuildBudgetHeader(planModel: planModel,),
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
            BlocBuilder<ExpenseCubit, ExpenseState>(
              builder: (context, state) {
                if (state is GetExpenseHistoryLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is GetExpenseHistorySuccess) {
                  return ExpenseSummarySection(expenses: state.expenses);
                }

                if (state is GetExpenseHistoryFailure) {
                  return Center(
                    child: Text(
                      state.errorMessage,
                      style: const TextStyle(color: Color(0xFF7A6F5E)),
                    ),
                  );
                }

                return const SizedBox.shrink();
              },
            ),
          ],
        ),
      ),
    );
  }
}
