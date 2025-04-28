import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../src/utils/connection/connectivity_service.dart';

//In questo file, definiamo il provider di Riverpod che fornisce lo stato della connessione.

final connectivityProvider = StreamProvider<ConnectivityResult>((ref) {
  final connectivityService = ConnectivityService();
  return connectivityService.connectivityStream;  // Ritorna il flusso di connessione
});