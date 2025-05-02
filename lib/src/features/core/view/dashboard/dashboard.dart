import "package:connectivity_plus/connectivity_plus.dart";
import "package:flutter/material.dart";
import "package:gestionale_calcio_mvc_flutter/src/constants/sizes.dart";
import "package:gestionale_calcio_mvc_flutter/src/constants/text_strings.dart";
import "package:gestionale_calcio_mvc_flutter/src/features/core/view/dashboard/widgets/appbar.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "package:get/get.dart";
import "package:get/get_core/src/get_main.dart";
import "../../../../../providers/connectivity_provider.dart";
import "../../../../constants/image_strings.dart";
import "../../../../utils/helper/helper_controller.dart";

///Dashboard Application - Firs page after login

//Provider per l'indice selezionato
final selectedIndexProvider = StateProvider<int>((ref) => 0);

class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({super.key});

  @override
  ConsumerState<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends ConsumerState<Dashboard> {
  @override
  Widget build(BuildContext context) {
    //Variables

    //Listen for connection changes via the StreamProvider
    final connectionStatus = ref.watch(connectivityProvider);
    final txtTheme = Theme.of(context).textTheme;
    final isDark = MediaQuery.of(context).platformBrightness ==
        Brightness.dark; //Dark mode
    final selectedIndex =
        ref.watch(selectedIndexProvider); //View provider selectedIndex

    void _onItemTapped(int index) {
      ref.read(selectedIndexProvider.notifier).state = index;
    }

    void _onPlusButtonPressed() {
      // Aggiungi qui la logica per creare qualcosa
      print('Cliccato il pulsante +');
    }

    return SafeArea(
      child: Scaffold(
        appBar: DashboardAppBar(isDark: isDark),

        ///Create a new Header
        drawer: Drawer(
          child: ListView(
            children: const [
              UserAccountsDrawerHeader(
                currentAccountPicture: Image(image: AssetImage(tLogoImage)),
                currentAccountPictureSize: Size(100, 100),
                accountName: Text('For Support:'),
                accountEmail: Text(emailSupport),
              ),
              ListTile(leading: Icon(Icons.home), title: Text('Home')),
              ListTile(
                  leading: Icon(Icons.verified_user), title: Text('Profile')),
              //ListTile(leading: Icon(Icons.shopping_bag), title: Text('Shop')),
              //ListTile(leading: Icon(Icons.favorite), title: Text('Wishlist')),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(tDashboardPadding),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                connectionStatus.when(
                  data: (status) {
                    if (status == ConnectivityResult.none) {
                      // Mostra lo snackbar solo se non è già aperto
                      if (!Get.isSnackbarOpen) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          Helper.errorConnectivity(
                            title: "Connessione Assente"
                          );
                        });
                      }
                    } else {
                      // Se la connessione torna attiva, chiudi lo snackbar
                      if (Get.isSnackbarOpen) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          Get.closeAllSnackbars();
                        });
                      }
                    }
                    return const SizedBox.shrink(); // non mostra nulla nella UI
                  },
                  loading: () => const SizedBox.shrink(),
                  error: (err, stack) => const SizedBox.shrink(),
                )
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _onPlusButtonPressed,
          tooltip: 'Crea',
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          notchMargin: 6.0,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.home,
                    color: selectedIndex == 0 ? Colors.blue : Colors.grey,
                  ),
                  onPressed: () => _onItemTapped(0),
                ),
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: selectedIndex == 1 ? Colors.blue : Colors.grey,
                  ),
                  onPressed: () => _onItemTapped(1),
                ),
                SizedBox(width: 40), //spazio per il FAB
                IconButton(
                  icon: Icon(
                    Icons.home,
                    color: selectedIndex == 2 ? Colors.blue : Colors.grey,
                  ),
                  onPressed: () => _onItemTapped(2),
                ),
                IconButton(
                  icon: Icon(
                    Icons.home,
                    color: selectedIndex == 3 ? Colors.blue : Colors.grey,
                  ),
                  onPressed: () => _onItemTapped(3),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
