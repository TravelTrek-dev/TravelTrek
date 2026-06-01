import 'package:flutter/material.dart';
import 'package:travel_trek/Features/plans/presentation/views/widgets/my_plans_view_body.dart';

class PlansView extends StatelessWidget {
  const PlansView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  MyPlansViewBody(),
    );
  }
}