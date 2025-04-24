import "package:flutter/material.dart";
import "package:gestionale_calcio_mvc_flutter/src/constants/sizes.dart";
import "package:gestionale_calcio_mvc_flutter/src/constants/text_strings.dart";
import "package:gestionale_calcio_mvc_flutter/src/features/core/view/dashboard/widgets/appbar.dart";
import "../../../../constants/image_strings.dart";

///Dashboard Application - Firs page after login

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    //Variables
    final txtTheme = Theme.of(context).textTheme;
    final isDark = MediaQuery.of(context).platformBrightness ==
        Brightness.dark; //Dark mode

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
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
