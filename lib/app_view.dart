import 'package:flutter/material.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});


  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      //  Themes
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,

      home: Scaffold(
        body: Center(
          child: Text('Hello World'),
        ),
      ),
      
    );
  }
}