part of 'connection_bloc.dart';

enum ConnectivityStatus { connected, disconnected, unknown }

class ConnectionState extends Equatable {
  final ConnectivityStatus status;

  const ConnectionState({required this.status});

  const ConnectionState.initial() 
    : this(status: ConnectivityStatus.unknown);

  const ConnectionState.connected() 
    : this(status: ConnectivityStatus.connected);

  const ConnectionState.disconnected()
    : this(status: ConnectivityStatus.disconnected);

  @override
  List<Object> get props => [status];
}

