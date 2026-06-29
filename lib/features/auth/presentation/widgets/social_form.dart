import 'package:cravely/config/theme/auth_theme/auth_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SocialForm extends StatelessWidget {
  final VoidCallback? onGoogleTap;
  final VoidCallback? onFacebookTap;

  const SocialForm({
    super.key,
    this.onGoogleTap,
    this.onFacebookTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        // Google Button
        _buildSocialButton(
          label: 'Continue with Google',
          iconPath: 'assets/icon/google-icon.png',
          onTap: onGoogleTap,
        ),
        const SizedBox(height: 10),

        // Facebook Button
        _buildSocialButton(
          label: 'Continue with Facebook',
          iconPath: 'assets/icon/facebook-icon.png',
          onTap: onFacebookTap,
        ),
      ],
    );
  }

  Widget _buildSocialButton({
    required String label,
    required String iconPath,
    VoidCallback? onTap,
  }) {
    return SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
          side: const BorderSide(color: AuthColors.socialBorder),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              iconPath,
              width: 20,
              height: 20,
            ),
            const SizedBox(width: 10),
            Text(
              label,
              style: GoogleFonts.montserrat(
                fontSize: 12,
                color: AuthColors.labelText,
                fontWeight: FontWeight.w700,
                letterSpacing: .04,
              ),
            ),
          ],
        ),
      ),
    );
  }
}