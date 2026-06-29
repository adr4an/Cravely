import 'package:cravely/features/auth/presentation/widgets/sign_in_form.dart';
import 'package:cravely/features/auth/presentation/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';

class TabBarViewContent extends StatelessWidget {
  final TabController tabController;

  const TabBarViewContent({
    super.key,
    required this.tabController,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.35, 
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.07,
        ),
        child: TabBarView(
          controller: tabController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            LoginForm(),
            SignUpForm(),
          ],
        ),
      ),
    );
  }
}