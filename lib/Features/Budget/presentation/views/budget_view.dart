import 'package:flutter/material.dart';
import 'package:travel_trek/Features/Budget/presentation/views/widgets/budget_view_body.dart';

class BudgetView extends StatelessWidget {
  const BudgetView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BudgetViewBody(),
    );
  }
}