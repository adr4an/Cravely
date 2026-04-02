import 'package:cravely/core/di/injection.dart';

GetIt getIt = GetIt.instance;

void setupDI() {
  _registerExternals();
  _registerRepositories();
}

void _registerExternals() {
  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn.instance);
  getIt.registerLazySingleton<FirebaseFirestore>(() => FirebaseFirestore.instance); 
}

void _registerRepositories() {
  getIt.registerLazySingleton<AuthRepo>(() => AuthImpl(
    getIt<FirebaseAuth>(),
    getIt<GoogleSignIn>(),
    getIt<FirebaseFirestore>(),
  ));
}