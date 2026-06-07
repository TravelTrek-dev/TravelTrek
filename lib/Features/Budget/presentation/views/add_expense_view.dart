import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_trek/Features/Budget/domain/repos/expense_repo.dart';
import 'package:travel_trek/Features/Budget/presentation/manger/cubit/expense_cubit.dart';
import 'package:travel_trek/Features/Budget/presentation/views/widgets/add_expense_view_body.dart';
import 'package:travel_trek/core/services/service_locator.dart';

class AddExpenseView extends StatelessWidget {
  const AddExpenseView({super.key});
  static const String routeName = 'addexpense';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Expense')),
      body: SafeArea(
        child: BlocProvider(
          create: (context) => ExpenseCubit(expenseRepo: getIt<ExpenseRepo>()),
          child: AddExpenseViewBody(),
        ),
      ),
    );
  }
}
