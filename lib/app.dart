import 'package:cravely/app_view.dart';
import 'package:cravely/core/di/di.dart';
import 'package:cravely/core/network/connection_bloc/connection_bloc.dart';
import 'package:cravely/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Contains all the providers and the app view
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt<AuthBloc>(),
        ),

        BlocProvider(
          create: (_) => getIt<ConnectionBloc>(),
        ),
      ], 

      child: AppView(),
    );
  }
}