import 'package:cravely/config/theme/auth_theme/auth_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomCheckbox extends StatelessWidget {
  final bool value;
  final String label;
  final ValueChanged<bool?> onChanged;
  final bool isExpanded; // ← new parameter

  const CustomCheckbox({
    super.key,
    required this.value,
    required this.label,
    required this.onChanged,
    this.isExpanded = false, // ← default false
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 18,
          height: 18,
          child: Transform.scale(
            scale: 0.85,
            child: Checkbox(
              value: value,
              onChanged: onChanged,
              activeColor: AuthColors.accent,
              checkColor: AuthColors.white,
              side: const BorderSide(
                color: AuthColors.placeholderText,
                width: 1.5,
              ),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4),
              ),
            ),
          ),
        ),
        const SizedBox(width: 8),

        isExpanded
            ? Expanded(
                child: Text(
                  label,
                  style: GoogleFonts.montserrat(
                    fontSize: 10,
                    color: AuthColors.subtitleText,
                    letterSpacing: .02,
                  ),
                ),
              )
            : Text(
                label,
                style: GoogleFonts.montserrat(
                  fontSize: 10,
                  color: AuthColors.subtitleText,
                  letterSpacing: .02,
                ),
              ),
      ],
    );
  }
}