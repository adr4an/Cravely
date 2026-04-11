import 'package:cravely/core/di/injection.dart';

GetIt getIt = GetIt.instance;

void setupDI() {
  _registerExternals();
  _registerRepositories();
  _registerBlocs();
}

void _registerExternals() {
  // Hive adapters
  registerAdapters();

  getIt.registerLazySingleton<FirebaseAuth>(() => FirebaseAuth.instance);
  getIt.registerLazySingleton<GoogleSignIn>(() => GoogleSignIn.instance);
  getIt.registerLazySingleton<FirebaseFirestore>(
    () => FirebaseFirestore.instance,
  );
  getIt.registerLazySingleton<Connectivity>(() => Connectivity());
}

void _registerRepositories() {
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthImpl(
      getIt<FirebaseAuth>(),
      getIt<GoogleSignIn>(),
      getIt<FirebaseFirestore>(),
    ),
  );

  getIt.registerLazySingleton<GetPizzaRepo>(
    () => GetPizzaImpl(getIt<FirebaseFirestore>()),
  );

  // Register Adapter for Hive local storage
  getIt.registerSingletonAsync<PizzaLocal>(() async {
    final pizzaLocal = PizzaLocal();

    await pizzaLocal.init();
    return pizzaLocal;
  });

}

void _registerBlocs() {
  getIt.registerFactory<AuthBloc>(() => AuthBloc(getIt<AuthRepo>()));

  getIt.registerFactory<GetPizzaBloc>(
    () => GetPizzaBloc(
      getIt<GetPizzaRepo>(), 
      getIt<PizzaLocal>()
    ),
  );

  getIt.registerLazySingleton<ConnectionBloc>(
    () => ConnectionBloc(getIt<Connectivity>()),
  );
}
