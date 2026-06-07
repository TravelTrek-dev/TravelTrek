import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_trek/Features/auth/domain/repos/auth_repo.dart';
import 'package:travel_trek/Features/auth/presentation/manger/sign_up_cubit/sign_up_cubit.dart';
import 'package:travel_trek/Features/auth/presentation/views/widgets/sign_up_view_body_bloc_consumer.dart';
import 'package:travel_trek/core/services/service_locator.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});
  static const routeName = "SignUpView";
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignUpCubit(authRepo: getIt<AuthRepo>()),
      child: Scaffold(body: SignupViewBodyBlocConsumer()),
    );
  }
}
