import 'package:cravely/config/theme/auth_theme/auth_theme.dart';
import 'package:cravely/features/auth/presentation/components/custom_button.dart';
import 'package:cravely/features/auth/presentation/components/custom_checkbox.dart';
import 'package:cravely/features/auth/presentation/components/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _obscurePassword = true;
  bool _rememberMe = false;

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
        const SizedBox(height: 14),

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
        const SizedBox(height: 14),

        // Remember me + Forgot password
        Row(
          children: [
            CustomCheckbox(
              value: _rememberMe,
              label: 'Remember me',
              onChanged: (val) => setState(() => _rememberMe = val ?? false),
            ),
            const Spacer(),
            
            GestureDetector(
              onTap: () {},
              child: Text(
                'Forgot Password ?',
                style: GoogleFonts.montserrat(
                  fontSize: 11,
                  color: AuthColors.accent,
                  fontWeight: FontWeight.w600,
                  letterSpacing: .02,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 15),

        // Login Button
        CustomButton(
          label: 'Login',
          onPressed: () {},
        ),
      ],
    );
  }
}