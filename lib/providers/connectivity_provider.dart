import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../src/utils/connection/connectivity_service.dart';


//Step-by-step explanation
//1. StreamProvider<ConnectivityResult>: It exposes a stream that emits values of type ConnectivityResult.
//2. final connectivityService = ConnectivityService(): I create an instance of a class. The connection status is being listened to
//3. return connectivityService.connectivtyStream: The stream of the connection is returned, and it emits a new value whenever the network status changes


///In this file, we define the Riverpod provider that provides the connection status.
final connectivityProvider = StreamProvider<ConnectivityResult>((ref) {
  final connectivityService = ConnectivityService();
  return connectivityService.connectivityStream;  //Return the connection flow
});


