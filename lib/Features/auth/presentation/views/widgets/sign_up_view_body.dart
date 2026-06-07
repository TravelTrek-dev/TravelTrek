import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_trek/Features/auth/presentation/manger/sign_up_cubit/sign_up_cubit.dart';
import 'package:travel_trek/Features/auth/presentation/views/widgets/already_have_an_account.dart';
import 'package:travel_trek/Features/auth/presentation/views/widgets/custom_or_dividor.dart';
import 'package:travel_trek/Features/auth/presentation/views/widgets/custom_text_form_field.dart';
import 'package:travel_trek/Features/auth/presentation/views/widgets/password_field.dart';
import 'package:travel_trek/Features/auth/presentation/views/widgets/sign_up_logo.dart';
import 'package:travel_trek/core/widgets/custom_button.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  late String name, email, password;
  bool isObsecure = false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 153),
            SignUpLogo(),
            const SizedBox(height: 16),
            const Text(
              'Create Your Account',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            const Text(
              'Plan your next adventure with precision',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            const SizedBox(height: 40),
            CustomTextFormField(
              onSaved: (name) {
                this.name = name!;
              },
              hintText: 'Full Name',
              prefixIcon: Icons.person_outline,
            ),
            const SizedBox(height: 16),
            CustomTextFormField(
              onSaved: (email) {
                this.email = email!;
              },
              hintText: 'Email Address',
              prefixIcon: Icons.email_outlined,
            ),
            const SizedBox(height: 16),
            PasswordField(
              onSaved: (value) {
                password = value!;
              },
            ),
            const SizedBox(height: 24),
            CustomButton(
              text: 'Sign Up',
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  formKey.currentState!.save();
                  BlocProvider.of<SignUpCubit>(
                    context,
                  ).createUserWithEmailAndPassword(
                    name: name,
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
            const AlreadyHaveAnAccound(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
