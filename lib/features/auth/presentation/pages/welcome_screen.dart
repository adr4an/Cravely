import 'package:cravely/config/theme/auth_theme/auth_theme.dart';
import 'package:cravely/features/auth/presentation/components/custom_button.dart';
import 'package:cravely/features/auth/presentation/pages/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Theme(
      data: CravelyAuthTheme.theme,
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFDDE8FF), // light blue at top
                Color(0xFFF5F5F5), // off white at bottom
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: size.width * 0.07,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
          
                  // SVG Illustration
                  SvgPicture.asset(
                    'assets/svg/pizza-maker.svg',
                    height: size.height * 0.40,
                  ),
                  const SizedBox(height: 32),
          
                  // Title
                  Text(
                    'Welcome to Saddle',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 22,
                      fontWeight: FontWeight.w900,
                      color: AuthColors.headingText,
                      letterSpacing: 0.1,
                    ),
                  ),
                  const SizedBox(height: 10),
          
                  // Subtitle
                  Text(
                    'Order your favorite food and get it\ndelivered fresh and hot right to your door.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      color: AuthColors.subtitleText,
                      letterSpacing: 0.05,
                    ),
                  ),
                  const SizedBox(height: 32),
          
                  // Continue Button
                  CustomButton(
                    label: 'Continue',
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation, secondaryAnimation) =>
                              const AuthPage(),
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            final slideTween = Tween(
                              begin: const Offset(0, 0.08), // slight slide from bottom
                              end: Offset.zero,
                            ).chain(CurveTween(curve: Curves.easeOut));

                            return FadeTransition(
                              opacity: animation,
                              child: SlideTransition(
                                position: animation.drive(slideTween),
                                child: child,
                              ),
                            );
                          },
                          transitionDuration: const Duration(milliseconds: 350),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
          
                  // Terms text
                  Text(
                    'By continuing you agree to the Privacy Policy\nand User Terms.',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.montserrat(
                      fontSize: 10,
                      color: AuthColors.subtitleText,
                      height: 1.5,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                  const SizedBox(height: 24),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}