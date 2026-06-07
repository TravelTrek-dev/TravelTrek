import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:travel_trek/Features/auth/presentation/manger/sign_in_cubit/sign_in_cubit.dart';
import 'package:travel_trek/Features/auth/presentation/views/widgets/sign_in_view_body.dart';
import 'package:travel_trek/Features/home/presentation/views/main_view.dart';
import 'package:travel_trek/constants.dart';
import 'package:travel_trek/core/helper_function/show_snack_bar.dart';
import 'package:travel_trek/core/services/prefs.dart';

class SignInViewBodyBlocConsumer extends StatelessWidget {
  const SignInViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignInCubit, SignInState>(
      listener: (context, state) async {
        if (state is SignInFailure) {
          showSnackBar(context, state.errorMessage);
        } else if (state is SignInSuccess) {
          Prefs.setString(kUserToken, state.userEntity.token);
          await Prefs.setUserEntity(state.userEntity);
          showSnackBar(context, 'Login successful. Welcome back.');

          Navigator.pushNamed(
            context,
            MainView.routeName,
            arguments: state.userEntity,
          );
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignInLoading ? true : false,
          child: SignInViewBody(),
        );
      },
    );
  }
}
