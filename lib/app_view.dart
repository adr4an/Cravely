import 'package:cravely/core/di/di.dart';
import 'package:cravely/core/network/connection_bloc/connection_bloc.dart';
import 'package:cravely/features/auth/presentation/bloc/auth_bloc/auth_bloc.dart';
import 'package:cravely/features/auth/presentation/pages/welcome_screen.dart';
import 'package:cravely/features/home/presentation/bloc/get_pizza_bloc/get_pizza_bloc.dart';
import 'package:cravely/features/home/presentation/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppView extends StatelessWidget {
  const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // Themes
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,

      home: BlocBuilder<AuthBloc, AuthState>(
        builder: (context, state) {
          // Navigate to Home Page
          if (state.status == AuthStatus.authenticated) {
            return BlocProvider(
              create: (_) => getIt<GetPizzaBloc>()
                ..add(
                  FetchPizzaEvent(
                    isConnected:
                        context.read<ConnectionBloc>().state.status ==
                        ConnectivityStatus.connected,
                  ),
                ),
              child: const HomeScreen(),
            );
          } 
          
          // Navigate to Welcome Page
          else if (state.status == AuthStatus.unauthenticated) {
            return const WelcomeScreen();
          }
          
          return SizedBox();
        },
      ),
    );
  }
}
