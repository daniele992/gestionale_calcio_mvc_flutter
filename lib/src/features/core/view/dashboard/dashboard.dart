import "package:flutter/material.dart";
import "package:gestionale_calcio_mvc_flutter/src/constants/colors.dart";
import "package:gestionale_calcio_mvc_flutter/src/constants/image_strings.dart";
import "package:gestionale_calcio_mvc_flutter/src/constants/sizes.dart";
import "package:gestionale_calcio_mvc_flutter/src/constants/text_strings.dart";
import "package:gestionale_calcio_mvc_flutter/src/features/core/view/dashboard/widgets/appbar.dart";
import "package:gestionale_calcio_mvc_flutter/src/features/core/view/dashboard/widgets/banners.dart";
import "package:gestionale_calcio_mvc_flutter/src/features/core/view/dashboard/widgets/categories.dart";
import "package:gestionale_calcio_mvc_flutter/src/features/core/view/dashboard/widgets/search.dart";
import "package:gestionale_calcio_mvc_flutter/src/features/core/view/dashboard/widgets/top_courses.dart";

class Dashboard extends StatelessWidget{
  const  Dashboard({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context)
  {
    final txtTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: const DashboardAppBar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(tDashBoardPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Heading
              Text(tDashBoardTitle, style: txtTheme.bodyMedium), //body2
              Text(tDashBoardHeading, style: txtTheme.headlineMedium), //headline2
              const SizedBox(height: tDashBoardPadding),

              //Search Box
              DashboardSearchBox(txtTheme: txtTheme),
              const SizedBox(height: tDashBoardPadding),

              //Categories
              DashboardCategories(txtTheme: txtTheme),
              const SizedBox(height: tDashBoardPadding),

              //Banners
              DashboardBanners(txtTheme: txtTheme),
              const SizedBox(height: tDashBoardPadding),

              //Top Course
              Text(tDashBoardTopCourses, style: txtTheme.headlineMedium?.apply(fontSizeFactor: 18 * 1.2)), //HeadLine4
              DashboardTopCourses(txtTheme: txtTheme),

            ],
          ),
        ),
      ),
    );
  }
}









