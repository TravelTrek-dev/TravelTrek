import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_trek/Features/auth/presentation/manger/sign_in_cubit/sign_in_cubit.dart';
import 'package:travel_trek/Features/auth/presentation/views/widgets/custom_social_button.dart';

class BuildSocialButton extends StatelessWidget {
  const BuildSocialButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        CustomSocialButton(label: 'Google', iconPath: '', onPressed: () { 
          BlocProvider.of<SignInCubit>(context).signInWithGoogle();
         },),
        SizedBox(width: 16),
        CustomSocialButton(label: 'Apple', iconPath: '', onPressed: () {  },),
      ],
    );
  }
}
