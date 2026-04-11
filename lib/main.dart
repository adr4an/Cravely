import 'package:cravely/app.dart';
import 'package:cravely/core/di/di.dart';
import 'package:cravely/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
  
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase initialization
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Hive initialization
  await Hive.initFlutter();

  setupDI();

  // wait for all async singletons be ready before running the app
  await getIt.allReady();
  
  runApp(const MyApp());
  
}