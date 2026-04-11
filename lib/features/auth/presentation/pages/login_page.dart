import 'package:flutter/material.dart';

class LogInPage extends StatelessWidget {
  const LogInPage({super.key});


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text('MyPage')),

      body: Center(
        child: Text('Login Page'),
      ),
    );

  }
}