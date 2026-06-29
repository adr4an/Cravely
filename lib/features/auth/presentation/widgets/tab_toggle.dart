import 'package:cravely/config/theme/auth_theme/auth_theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabToggle extends StatelessWidget {
  final TabController tabController;

  const TabToggle({
    super.key,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      child: Container(
        decoration: BoxDecoration(
          color: AuthColors.inactive,
          borderRadius: BorderRadius.circular(5),
        ),
        padding: const EdgeInsets.all(3),
        child: TabBar(
          controller: tabController,
          indicator: BoxDecoration(
            color: AuthColors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(
                // ignore: deprecated_member_use
                color: AuthColors.headingText.withOpacity(0.08),
                blurRadius: 4,
              ),
            ],
          ),
          indicatorSize: TabBarIndicatorSize.tab,
          dividerColor: Colors.transparent,
          labelColor: AuthColors.accent,
          unselectedLabelColor: AuthColors.placeholderText,
          labelStyle: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            fontSize: 12,
            letterSpacing: .1,
          ),
          tabs: const [
            Tab(text: 'Login'),
            Tab(text: 'Sign Up'),
          ],
        ),
      ),
    );
  }
}