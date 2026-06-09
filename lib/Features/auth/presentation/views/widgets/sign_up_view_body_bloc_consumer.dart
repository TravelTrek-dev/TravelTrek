import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_trek/Features/auth/presentation/manger/sign_up_cubit/sign_up_cubit.dart';
import 'package:travel_trek/Features/auth/presentation/views/widgets/sign_up_view_body.dart';
import 'package:travel_trek/core/helper_function/show_snack_bar.dart';
import 'package:travel_trek/core/widgets/app_modal_hud.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpFailure) {
          final msg = state.errorMessage;
          if (msg.toLowerCase().contains('success')) {
            showSuccessSnackBar(context, msg);
          } else {
            showErrorSnackBar(context, msg);
          }
        } else if (state is SignUpSuccess) {
          showSuccessSnackBar(context, 'Your account has been created successfully!');
        }
      },
      builder: (context, state) {
        return AppModalHud(
          isLoading: state is SignUpLoading,
          message: 'Creating account',
          child: SignUpViewBody(),
        );
      },
    );
  }
}
