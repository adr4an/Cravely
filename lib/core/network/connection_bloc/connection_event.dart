part of 'connection_bloc.dart';

sealed class ConnectionEvent extends Equatable {
  const ConnectionEvent();

  @override
  List<Object> get props => [];
}

// one time check event
class CheckConnectivity extends ConnectionEvent {
  const CheckConnectivity();
}

// real time change event
class ConnectionChanged extends ConnectionEvent {
  final bool isConnected;

  const ConnectionChanged(this.isConnected);

  @override
  List<Object> get props => [isConnected];
}