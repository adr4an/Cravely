import 'package:cravely/config/theme/auth_theme/auth_theme.dart';
import 'package:cravely/features/auth/presentation/widgets/social_form.dart';
import 'package:cravely/features/auth/presentation/widgets/tab_bar_view.dart';
import 'package:cravely/features/auth/presentation/widgets/tab_toggle.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
      initialIndex: 0,
      length: 2,
      vsync: this,
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: CravelyAuthTheme.theme,
      child: Scaffold(
        backgroundColor: AuthColors.background,
        resizeToAvoidBottomInset: false,
        
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: AuthColors.background,
          title: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset(
                'assets/icon/app-icon2.png',
                height: 28,
                width: 28,
              ),
              const SizedBox(width: 8),

              ShaderMask(
                shaderCallback: (bounds) => CravelyGradients.primaryButton.createShader(bounds),
                child: Text(
                  'Saddle',
                  style: GoogleFonts.montserrat(
                    fontSize: 20,
                    fontWeight: FontWeight.w800,
                    color: Colors.white, // ← must be white for shader to show
                  ),
                ),
              ),
            ],
          ),
        ),
        
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Top section
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.07,
                vertical: 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
      
                  // Title
                  Text(
                    'Get Started Now',
                    style: GoogleFonts.montserrat(
                      fontSize: 21,
                      fontWeight: FontWeight.w700,
                      color: AuthColors.headingText,
                    ),  
                  ),
                  const SizedBox(height: 5),
      
                  // Subtitle
                  SizedBox(
                    width: 300,
                    child: Text(
                      'Create an account or log in to explore about our app',
                      textAlign: TextAlign.center,
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        color: AuthColors.subtitleText,
                        
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
      
                  TabToggle(tabController: tabController),
                  const SizedBox(height: 24),
                ],
              ),
            ),
      
            // TabBarView
            TabBarViewContent(tabController: tabController),
           
            // Divider
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.90,
              child: Row(
                children: [
                  Expanded(child: Divider(color: AuthColors.inputBorder)),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    child: Text(
                      'Or',
                      style: GoogleFonts.montserrat(
                        fontSize: 12,
                        color: AuthColors.subtitleText,
                      ),
                    ),
                  ),
                  Expanded(child: Divider(color: AuthColors.inputBorder)),
                ],
              ),
            ),
            const SizedBox(height: 15),
      
            // Social Buttons
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.07,
                vertical: 15,
              ),
              child: const SocialForm(),
            ),
          
          ],
        ),
      ),
    );
  }
}