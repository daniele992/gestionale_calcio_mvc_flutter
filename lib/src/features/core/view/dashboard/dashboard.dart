import "package:flutter/material.dart";
import "package:gestionale_calcio_mvc_flutter/src/constants/sizes.dart";
import "package:gestionale_calcio_mvc_flutter/src/constants/text_strings.dart";
import "package:gestionale_calcio_mvc_flutter/src/features/core/view/dashboard/widgets/appbar.dart";
import "package:gestionale_calcio_mvc_flutter/src/features/core/view/dashboard/widgets/banners.dart";
import "package:gestionale_calcio_mvc_flutter/src/features/core/view/dashboard/widgets/categories.dart";
import "package:gestionale_calcio_mvc_flutter/src/features/core/view/dashboard/widgets/search.dart";
import "package:gestionale_calcio_mvc_flutter/src/features/core/view/dashboard/widgets/top_courses.dart";

import "../../../../constants/image_strings.dart";

class Dashboard extends StatelessWidget{
  const  Dashboard({super.key});

  @override
  Widget build(BuildContext context)
  {
    //Variables
    final txtTheme = Theme.of(context).textTheme;
    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark; //Dark mode

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
               accountName: Text('Coding with T'),
               accountEmail: Text('support@codingwithT.com'),
             ),
             ListTile(leading: Icon(Icons.home), title: Text('Home')),
             ListTile(leading: Icon(Icons.verified_user), title: Text('Profile')),
             ListTile(leading: Icon(Icons.shopping_bag), title: Text('Shop')),
             ListTile(leading: Icon(Icons.favorite), title: Text('Wishlist')),
           ],
         ),
       ),
       body: SingleChildScrollView(
         child: Container(
           padding: const EdgeInsets.all(tDashboardPadding),
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               //Heading
               Text(tDashboardTitle, style: txtTheme.bodyMedium),
               Text(tDashboardHeading, style: txtTheme.displayMedium),
               const SizedBox(height: tDashboardPadding),

               //Search Box
               DashboardSearchBox(txtTheme: txtTheme),
               const SizedBox(height: tDashboardPadding),

               //Categories
               DashboardCategories(txtTheme: txtTheme),
               const SizedBox(height: tDashboardPadding),

               //Banners
               DashboardBanners(txtTheme: txtTheme, isDark: isDark),
               const SizedBox(height: tDashboardPadding),

               //Top Course
               Text(tDashboardTopCourses, style: txtTheme.headlineMedium?.apply(fontSizeFactor: 1.2)),
               DashboardTopCourses(txtTheme: txtTheme, isDark: isDark)
             ],
           ),
         ),
       ),
     ),
    );
  }
}









