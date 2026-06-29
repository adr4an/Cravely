import 'package:cravely/config/theme/auth_theme/auth_theme.dart';
import 'package:cravely/features/auth/presentation/components/custom_button.dart';
import 'package:cravely/features/auth/presentation/components/custom_checkbox.dart';
import 'package:cravely/features/auth/presentation/components/custom_text_field.dart';
import 'package:flutter/material.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool _obscurePassword = true;
  bool _acceptTerms = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        // Email
        const CustomTextField(
          label: 'Email Address',
          hint: 'Please enter your email',
          suffixIcon: Icons.email_outlined,
        ),
        const SizedBox(height: 12),

        // Password
        CustomTextField(
          label: 'Password',
          hint: 'Password',
          obscureText: _obscurePassword,
          suffixWidget: GestureDetector(
            onTap: () => setState(() => _obscurePassword = !_obscurePassword),
            child: Icon(
              _obscurePassword ? Icons.visibility_off : Icons.visibility,
              color: AuthColors.placeholderText,
              size: 16,
            ),
          ),
        ),
        const SizedBox(height: 12),

        // Terms & Conditions
        CustomCheckbox(
          value: _acceptTerms,
          label: 'By continuing you accept our Privacy Policy and Terms & Conditions',
          onChanged: (val) => setState(() => _acceptTerms = val ?? false),
          isExpanded: true, 
        ),
        const SizedBox(height: 16),

        // Sign Up Button
        CustomButton(
          label: 'Sign Up',
          onPressed: () {},
        ),
      ],
    );
  }
}