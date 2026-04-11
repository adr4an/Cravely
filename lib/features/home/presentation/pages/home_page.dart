import 'package:cravely/core/di/injection.dart';
import 'package:flutter/material.dart' hide ConnectionState;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cravely/shared/widgets/connection_listener.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ConnectionListener(

      onConnected: () => context.read<GetPizzaBloc>().add(
        const FetchPizzaEvent(isConnected: true),
      ),
      
      onDisconnected: () => context.read<GetPizzaBloc>().add(
        const FetchPizzaEvent(isConnected: false),
      ),

      child: Scaffold(
        body: BlocBuilder<GetPizzaBloc, GetPizzaState>(
          builder: (context, state) {
            if (state.status == GetPizzaStatus.loading) {
              // show shimmer widget effect
            } else if (state.status == GetPizzaStatus.successFetch) {
              // direct to home page
            } else if (state.status == GetPizzaStatus.failedFetch) {
              // show error message
            } else if (state.status == GetPizzaStatus.offline) {
              // show offline ui widget
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }
}