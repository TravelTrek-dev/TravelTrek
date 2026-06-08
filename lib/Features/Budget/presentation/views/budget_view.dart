import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_trek/Features/Budget/domain/repos/expense_repo.dart';
import 'package:travel_trek/Features/Budget/presentation/manger/cubit/expense_cubit.dart';
import 'package:travel_trek/Features/Budget/presentation/views/widgets/budget_view_body.dart';
import 'package:travel_trek/Features/home/data/models/plan_model/plan_model.dart';
import 'package:travel_trek/constants.dart';
import 'package:travel_trek/core/services/prefs.dart';
import 'package:travel_trek/core/services/service_locator.dart';

class BudgetView extends StatelessWidget {
  const BudgetView({super.key, required this.planModel});
  final PlanModel planModel;
  @override
  Widget build(BuildContext context) {
    final userToken = Prefs.getString(kUserToken);
    final tripId = planModel.value!.id;

    return Scaffold(
      body: BlocProvider(
        create: (context) =>
            ExpenseCubit(expenseRepo: getIt<ExpenseRepo>())
              ..getExpenseHistory(tripId: tripId!, userToken: userToken),
        child: BudgetViewBody(planModel: planModel,),
      ),
    );
  }
}
