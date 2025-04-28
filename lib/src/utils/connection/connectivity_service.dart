import 'package:connectivity_plus/connectivity_plus.dart';

//Questa classe contiene la logica per verificare la connessione.

class ConnectivityService {
  static final ConnectivityService _instance = ConnectivityService._internal();

  factory ConnectivityService() {
    return _instance;
  }

  ConnectivityService._internal();

  // Restituisce un flusso di connessione che emette una lista di ConnectivityResult
  Stream<ConnectivityResult> get connectivityStream {
    final connectivity = Connectivity();
    return connectivity.onConnectivityChanged.map((resultList) {
      // Restituisce il primo elemento della lista (il più recente stato della connessione)
      return resultList.isNotEmpty ? resultList.first : ConnectivityResult.none;
    });
  }

  // Modifica per ottenere il primo valore della lista
  Future<ConnectivityResult> checkConnectivity() async {
    final connectivity = Connectivity();
    final resultList = await connectivity.checkConnectivity(); // Restituisce una lista
    return resultList.isNotEmpty ? resultList.first : ConnectivityResult.none; // Ottieni il primo risultato della lista
  }
}