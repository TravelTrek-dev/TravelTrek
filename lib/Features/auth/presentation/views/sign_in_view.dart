import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_trek/Features/auth/domain/repos/auth_repo.dart';
import 'package:travel_trek/Features/auth/presentation/manger/sign_in_cubit/sign_in_cubit.dart';
import 'package:travel_trek/Features/auth/presentation/views/widgets/sign_in_view_body_bloc_consumer.dart';
import 'package:travel_trek/core/services/service_locator.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  static const routeName = 'SignInView';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignInCubit(authRepo: getIt<AuthRepo>()),
      child: Scaffold(
        backgroundColor: const Color(0xffFDFDFB),
        body: SafeArea(child: SignInViewBodyBlocConsumer()),
      ),
    );
  }
}
