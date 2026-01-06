import 'package:e_commerce_flutter/presentation/screens/sign_up/widgets/text_field_section.dart';
import 'package:e_commerce_flutter/theme/color_manager.dart';
import 'package:e_commerce_flutter/theme/fonts.dart';
import 'package:flutter/material.dart';

import '../../widgets/CustomButton.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.primaryWhite,
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Already have an account?', style: AppTextStyle.caption),
            Text(
              'Log In',
              style: AppTextStyle.caption.copyWith(
                decoration: TextDecoration.underline,
                color: ColorManager.grey900,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 44),
                Text('Create an account', style: AppTextStyle.heading),
                const SizedBox(height: 8),
                Text('Let’s create your account.', style: AppTextStyle.caption),
                const SizedBox(height: 24),

                textFieldSection('Full Name', 'Enter your full name'),
                textFieldSection('Email', 'Enter your email address'),
                textFieldSection('Password', 'Enter your password', true),
                textFieldSection('Confirm Password','Enter your password',true),

                const SizedBox(height: 44),
                customButton(text: 'Create Account'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}