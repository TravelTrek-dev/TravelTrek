import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:travel_trek/Features/auth/presentation/manger/sign_up_cubit/sign_up_cubit.dart';
import 'package:travel_trek/Features/auth/presentation/views/widgets/sign_up_view_body.dart';
import 'package:travel_trek/core/helper_function/show_snack_bar.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpFailure) {
          showSnackBar(context, state.errorMessage);
        }
        else if( state is SignUpSuccess){ 
          showSnackBar(context, 'Your account has been created successfully!');
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
          inAsyncCall: state is SignUpLoading ? true : false,
          child: SignUpViewBody(),
        );
      },
    );
  }


}
