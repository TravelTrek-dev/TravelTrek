import 'package:flutter/material.dart';
import 'package:travel_trek/Features/home/presentation/views/widgets/home_view.dart';
import 'package:travel_trek/Features/plans/presentation/views/plans_view.dart';


class MainViewBody extends StatelessWidget {
  const MainViewBody({super.key, required this.currentindex});
    final int currentindex;
  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: currentindex,
      children: [HomeView() , PlansView() , SizedBox() , SizedBox()],
    );
  }
}
