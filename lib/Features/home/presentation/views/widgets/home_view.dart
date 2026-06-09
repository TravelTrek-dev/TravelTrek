import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_trek/Features/home/domain/repos/home_repo.dart';
import 'package:travel_trek/Features/home/presentation/manger/generate_plan/generate_plan_cubit_cubit.dart';
import 'package:travel_trek/Features/home/presentation/views/widgets/home_view_body.dart';
import 'package:travel_trek/core/services/service_locator.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GeneratePlanCubitCubit(homeRepo: getIt<HomeRepo>()),
      child: HomeViewBody(),
    );
  }
}
