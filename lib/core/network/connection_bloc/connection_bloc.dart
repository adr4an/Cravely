import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';

part 'connection_event.dart';
part 'connection_state.dart';

class ConnectionBloc extends Bloc<ConnectionEvent, ConnectionState> {
  final Connectivity _connectivity;
  late final StreamSubscription _connectivitySubscription;

  ConnectionBloc(this._connectivity) : super(const ConnectionState.initial()) {
    // initial check
    add(const CheckConnectivity()); 

    // listen to connectivity changes
    _connectivitySubscription = _connectivity.onConnectivityChanged.listen(
      (result) => add(ConnectionChanged(result != ConnectivityResult.none)),
    );

    // one time check for connectivity status
    on<CheckConnectivity>((event, emit) async {
      // return enum connectivity result
      final result = await _connectivity.checkConnectivity();

      emit(result != ConnectivityResult.none
        ? const ConnectionState.connected()
        : const ConnectionState.disconnected(),
      );
    });

    // real time check for connectivity changes
    on<ConnectionChanged>((event, emit) {
      emit( event.isConnected 
          ? const ConnectionState.connected() 
          : const ConnectionState.disconnected()
      );
    });

  }

  @override
  Future<void> close() {
    _connectivitySubscription.cancel();
    return super.close();
  }
}