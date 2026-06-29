import 'package:cravely/app.dart';
import 'package:cravely/core/di/di.dart';
import 'package:cravely/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:cravely/core/utils/helpers/log_helper.dart';
// import 'package:rxdart/rxdart.dart';


  final Map<int, String> fakeDatabase = {
    1: "Apple",
    2: "Banana",
    3: "Cherry",
  };

  Future<String> fetchFruit(int id) async {
    await Future.delayed(Duration(seconds: 1));
    return fakeDatabase[id] ?? "Not Found";
  }
  
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Firebase initialization
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  // Local database (Hive) initialization
  await Hive.initFlutter();

  // Dependency injection setup
  setupDI();

  // wait for all async singletons be ready before running the app
  await getIt.allReady();

  // Stream.fromIterable([1, 2, 3])
  // .switchMap((id) => Stream.fromFuture(fetchFruit(id)))
  // .listen((fruit) => logger.i("Fetched fruit: $fruit"));

  
  runApp(const MyApp());
  
}