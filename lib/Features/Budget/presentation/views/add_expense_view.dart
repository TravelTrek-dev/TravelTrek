import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:travel_trek/Features/Budget/presentation/manger/cubit/expense_cubit.dart';
import 'package:travel_trek/Features/Budget/presentation/views/widgets/add_expense_view_body.dart';
import 'package:travel_trek/Features/home/data/models/plan_model/plan_model.dart';

class AddExpenseView extends StatelessWidget {
  final PlanModel planModel;
  
  const AddExpenseView({super.key, required this.planModel});
  static const String routeName = 'addexpense';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add Expense')),
      body: SafeArea(
        child: BlocProvider.value(
          value: BlocProvider.of<ExpenseCubit>(context),
          child: AddExpenseViewBody(planModel: planModel,),
        ),
      ),
    );
  }
}
