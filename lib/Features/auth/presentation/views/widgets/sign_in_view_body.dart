import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_trek/Features/auth/presentation/manger/sign_in_cubit/sign_in_cubit.dart';
import 'package:travel_trek/Features/auth/presentation/views/widgets/build_social_button.dart';
import 'package:travel_trek/Features/auth/presentation/views/widgets/custom_or_dividor.dart';
import 'package:travel_trek/Features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:travel_trek/Features/auth/presentation/views/widgets/dont_have_an_account.dart';
import 'package:travel_trek/Features/auth/presentation/views/widgets/password_field.dart';
import 'package:travel_trek/Features/auth/presentation/views/widgets/terms_and_condtions.dart';
import 'package:travel_trek/core/widgets/custom_button.dart';

class SignInViewBody extends StatefulWidget {
  const SignInViewBody({super.key});

  @override
  State<SignInViewBody> createState() => _SignInViewBodyState();
}

class _SignInViewBodyState extends State<SignInViewBody> {
  late String email, password;
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Form(
        autovalidateMode: autovalidateMode,
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(Icons.explore_outlined, color: Color(0xff8B7E7A)),
                const SizedBox(width: 8),
                Text(
                  'TravelTrek',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 40),
            const Text(
              'Welcome Back 👋',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                fontFamily: 'Serif',
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Sign in to continue your journey with us.',
              style: TextStyle(color: Colors.grey, fontSize: 16),
            ),
            const SizedBox(height: 32),

            // Form Fields
            const Text(
              'Email Address',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            CustomTextFormField(
              onSaved: (email) => this.email = email!,
              hintText: 'Email',
              prefixIcon: Icons.email_outlined,
            ),

            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Password',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Forgot Password?',
                    style: TextStyle(color: Colors.grey, fontSize: 12),
                  ),
                ),
              ],
            ),
            PasswordField(
              onSaved: (value) {
                password = value!;
              },
            ),
            const SizedBox(height: 16),

            const TermsAndCondtions(),

            const SizedBox(height: 24),

            CustomButton(
              text: 'Sign In',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  BlocProvider.of<SignInCubit>(
                    context,
                  ).signInWithEmailAndPassword(
                    email: email,
                    password: password,
                  );
                } else {
                  autovalidateMode = AutovalidateMode.always;
                  setState(() {});
                }
              },
            ),

            const SizedBox(height: 32),
            const CustomOrDivider(),
            const SizedBox(height: 32),
            const BuildSocialButton(),
            const SizedBox(height: 40),
            const DontHaveAnAccount(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
