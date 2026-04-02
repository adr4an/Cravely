import 'package:cravely/app.dart';
import 'package:cravely/core/di/di.dart';
import 'package:cravely/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
  
void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  setupDI();
  
  runApp(const MyApp());
  
}