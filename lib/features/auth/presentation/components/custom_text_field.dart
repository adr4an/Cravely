import 'package:cravely/config/theme/auth_theme/auth_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData? suffixIcon;
  final bool obscureText;
  final Widget? suffixWidget;
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  const CustomTextField({
    super.key,
    required this.label,
    required this.hint,
    this.suffixIcon,
    this.obscureText = false,
    this.suffixWidget,
    this.controller,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label
        Text(
          label,
          style: GoogleFonts.montserrat(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AuthColors.labelText,
            letterSpacing: .05,
          ),
        ),
        const SizedBox(height: 6),

        // Input
        TextField(
          controller: controller,
          obscureText: obscureText,
          onChanged: onChanged,
          style: GoogleFonts.montserrat(
            fontSize: 12,
            color: AuthColors.headingText,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: GoogleFonts.montserrat(
              color: AuthColors.placeholderText,
              fontSize: 12,
              letterSpacing: .05,
            ),
            suffixIcon: suffixWidget ??
                (suffixIcon != null
                    ? Icon(suffixIcon, color: AuthColors.placeholderText, size: 16)
                    : null),
            filled: true,
            fillColor: AuthColors.white,
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AuthColors.inputBorder),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AuthColors.inputBorder),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: AuthColors.gradientStart, width: 1.5),
            ),
          ),
        ),
      ],
    );
  }
}