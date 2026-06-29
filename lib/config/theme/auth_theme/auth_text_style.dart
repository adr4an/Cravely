import 'package:cravely/config/theme/auth_theme/auth_theme.dart';
import 'package:flutter/material.dart';

class CravelyAuthTexttStyles {

  // Get Started Now
  static const TextStyle heading = TextStyle(
    color: AuthColors.headingText,
    fontWeight: FontWeight.w700,
    fontSize: 20,
    fontFamily: 'Poppins',
  );

  // Create an account or log in to explore about our app
  static const TextStyle subtitle = TextStyle(
    color: AuthColors.subtitleText,
    fontSize: 12,
    fontFamily: 'Poppins',
  );

  // Tab labels (Login / Sign Up)
  static const TextStyle tabActive = TextStyle(
    color: AuthColors.accent,
    fontSize: 14,
    fontWeight: FontWeight.w600,
    fontFamily: 'Poppins',
  );

  // Inactive tab labels
  static const TextStyle tabInactive = TextStyle(
    color: AuthColors.subtitleText,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontFamily: 'Poppins',
  );

  // Form field labels
  static const TextStyle label = TextStyle(
    color: AuthColors.labelText,
    fontSize: 14,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins',
  );

  // Form field placeholders
  static const TextStyle placeholder = TextStyle(
    color: AuthColors.placeholderText,
    fontSize: 14,
    fontFamily: 'Poppins',
  );

  /* 
    By continuing you accept our Privacy 
    Policy and Terms & Conditions | Remember me
  */
  static const TextStyle termsText = TextStyle(
    color: AuthColors.labelText,
    fontSize: 12,
    fontFamily: 'Poppins',
  );

  // Forgot Password?
  static const TextStyle forgotPassword = TextStyle(
    color: AuthColors.accent,
    fontSize: 13,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins',
  );

  // Login and Sign Up Buttons
  static const TextStyle buttonText = TextStyle(
    color: Colors.white,
    fontSize: 16,
    fontWeight: FontWeight.w600,
    fontFamily: 'Poppins',
  );

  // Fresh Pizza, Right to You
  static const TextStyle onboardingTitle = TextStyle(
    color: AuthColors.headingText,
    fontWeight: FontWeight.bold,
    fontSize: 24,
    fontFamily: 'Poppins',
  );

  /* 
   Order your favorite pizza and get it 
   delivered fresh and hot right to your door
  */
  static const TextStyle onboardingSubtitle = TextStyle(
    color: AuthColors.subtitleText,
    fontSize: 14,
    fontFamily: 'Poppins',
  );

}