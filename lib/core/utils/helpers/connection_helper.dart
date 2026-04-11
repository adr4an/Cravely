import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

// check if the device is connected to the internet
class InternetConnectionHelper {

  // helper method - avoid repeating logic
  bool _isConnected(ConnectivityResult result) {
    return result == ConnectivityResult.mobile ||
           result == ConnectivityResult.wifi ||
           result == ConnectivityResult.vpn;
  }

  // one time check 
  Future<bool> checkInternetConnection() async {
    final result = await Connectivity().checkConnectivity();

    return _isConnected(result);
  }

  // real time check 
  Stream<bool> get onConnectionChanged => 
    Connectivity().onConnectivityChanged
      .map((result) => _isConnected(result));

}