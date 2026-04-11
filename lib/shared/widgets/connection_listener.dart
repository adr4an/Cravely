import 'package:cravely/core/network/bloc/connection_bloc.dart';
import 'package:flutter/material.dart' hide ConnectionState;
import 'package:flutter_bloc/flutter_bloc.dart';

class ConnectionListener extends StatelessWidget {
  final Widget child;
  final VoidCallback? onConnected;
  final VoidCallback? onDisconnected;

  const ConnectionListener({
    super.key,
    required this.child,
    this.onConnected,
    this.onDisconnected,
  });

  @override
  Widget build(BuildContext context) {
    return BlocListener<ConnectionBloc, ConnectionState>(
      // only fires listener if status actually changed to avoid unnecessary callbacks
      listenWhen: (previous, current) => 
        previous.status != current.status,

      listener: (context, state) {
        // Trigger callbacks based on connectivity status
        if (state.status == ConnectivityStatus.connected) {
          onConnected?.call();
        } 
        
        else if (state.status == ConnectivityStatus.disconnected) {
          onDisconnected?.call();
        }
      },

      child: child,
    );
  }
}
