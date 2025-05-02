import "package:connectivity_plus/connectivity_plus.dart";
import "package:flutter/material.dart";
import "package:gestionale_calcio_mvc_flutter/src/constants/text_strings.dart";
import "package:gestionale_calcio_mvc_flutter/src/features/core/view/dashboard/widgets/appbar.dart";
import 'package:flutter_riverpod/flutter_riverpod.dart';
import "../../../../../providers/connectivity_provider.dart";
import "../../../../constants/image_strings.dart";
import "../../../matches/view/insertMatches_screen.dart";
import "../../../matches/view/listMatches_screen.dart";
import "../../../players/view/insertPlayers_screen.dart";
import "../../../players/view/listPlayers_screen.dart";

///Dashboard Application - Firs page after login
final pageIndexProvider = StateProvider<int>((ref) => 0);

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
    final List<Widget> _pages = [
      InsertPlayers(),
      ListPlayers(),
      InsertMatches(),
      ListMatches(),
    ];

    final txtTheme = Theme.of(context).textTheme;
    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark; //Dark mode
    //Provider per l'indice selezionato
    final pageIndex = ref.watch(pageIndexProvider); //View provider selectedIndex

    void _onItemTapped(int index) {
      ref.read(pageIndexProvider.notifier).state = index;
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
              ListTile(leading: Icon(Icons.verified_user), title: Text('Profile')),
            ],
          ),
        ),
        body: _pages[pageIndex],
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
                    color: pageIndex == 0 ? Colors.blue : Colors.grey,
                  ),
                  onPressed: () => ref.read(pageIndexProvider.notifier).state = 0,
                ),
                IconButton(
                  icon: Icon(
                    Icons.search,
                    color: pageIndex == 1 ? Colors.blue : Colors.grey,
                  ),
                    onPressed: () => ref.read(pageIndexProvider.notifier).state = 1,
                ),
                SizedBox(width: 40), //Space for the FAB
                IconButton(
                  icon: Icon(
                    Icons.home,
                    color: pageIndex == 2 ? Colors.blue : Colors.grey,
                  ),
                  onPressed: () => ref.read(pageIndexProvider.notifier).state = 2,
                ),
                IconButton(
                  icon: Icon(
                    Icons.home,
                    color: pageIndex == 3 ? Colors.blue : Colors.grey,
                  ),
                  onPressed: () => ref.read(pageIndexProvider.notifier).state = 3,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
