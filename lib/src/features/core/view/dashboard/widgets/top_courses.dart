import 'package:flutter/material.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/sizes.dart';
import '../../../models/dashboard/categories_model.dart';

class DashboardTopCourses extends StatelessWidget {
  const DashboardTopCourses({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    final list = DashboardCategoriesModel.list;
    return SizedBox(
      height: 200,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: list.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: list[index].onPress,
          child: SizedBox(
            width: 320,
            height: 200,
            child: Padding(
              padding: const EdgeInsets.only(right: 10, top: 5),
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: tCardBgColor),
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                            child: Text(
                              list[index].title,
                              style: txtTheme.headlineMedium, //headLine4
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            )
                        ),
                        const Flexible(child: Image(image: AssetImage(tTopCourseImage1), height: 110)),
                      ],
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(shape: const CircleBorder()),
                          onPressed: (){},
                          child: const Icon(Icons.play_arrow),
                        ),
                        const SizedBox(width: tDashBoardCardPadding),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("3 Sections", style: txtTheme.headlineMedium, overflow: TextOverflow.ellipsis), //headLine4
                            Text("Programming Languages", style: txtTheme.bodyMedium, overflow: TextOverflow.ellipsis), //bodyText2
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          /*SizedBox(
            width: 320,
            height: 200,
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: tCardBgColor),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: Text(
                            "Flutter Crash Course",
                            style: txtTheme.headlineMedium, //headLine4
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )
                      ),
                      const Flexible(child: Image(image: AssetImage(tTopCourseImage1), height: 110)),
                    ],
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: const CircleBorder()),
                        onPressed: (){},
                        child: const Icon(Icons.play_arrow),
                      ),
                      const SizedBox(width: tDashBoardCardPadding),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("3 Sections", style: txtTheme.headlineMedium, overflow: TextOverflow.ellipsis), //headLine4
                          Text("Programming Languages", style: txtTheme.bodyMedium, overflow: TextOverflow.ellipsis), //bodyText2
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 320,
            height: 200,
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: tCardBgColor),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: Text(
                            "Flutter Crash Course",
                            style: txtTheme.headlineMedium, //headLine4
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )
                      ),
                      const Flexible(child: Image(image: AssetImage(tTopCourseImage1), height: 110)),
                    ],
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: const CircleBorder()),
                        onPressed: (){},
                        child: const Icon(Icons.play_arrow),
                      ),
                      const SizedBox(width: tDashBoardCardPadding),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("3 Sections", style: txtTheme.headlineMedium, overflow: TextOverflow.ellipsis), //headLine4
                          Text("Programming Languages", style: txtTheme.bodyMedium, overflow: TextOverflow.ellipsis), //bodyText2
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 320,
            height: 200,
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: tCardBgColor),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: Text(
                            "Flutter Crash Course",
                            style: txtTheme.headlineMedium, //headLine4
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )
                      ),
                      const Flexible(child: Image(image: AssetImage(tTopCourseImage1), height: 110)),
                    ],
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: const CircleBorder()),
                        onPressed: (){},
                        child: const Icon(Icons.play_arrow),
                      ),
                      const SizedBox(width: tDashBoardCardPadding),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("3 Sections", style: txtTheme.headlineMedium, overflow: TextOverflow.ellipsis), //headLine4
                          Text("Programming Languages", style: txtTheme.bodyMedium, overflow: TextOverflow.ellipsis), //bodyText2
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            width: 320,
            height: 200,
            child: Container(
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: tCardBgColor),
              padding: const EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: Text(
                            "Flutter Crash Course",
                            style: txtTheme.headlineMedium, //headLine4
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          )
                      ),
                      const Flexible(child: Image(image: AssetImage(tTopCourseImage1), height: 110)),
                    ],
                  ),
                  Row(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(shape: const CircleBorder()),
                        onPressed: (){},
                        child: const Icon(Icons.play_arrow),
                      ),
                      const SizedBox(width: tDashBoardCardPadding),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("3 Sections", style: txtTheme.headlineMedium, overflow: TextOverflow.ellipsis), //headLine4
                          Text("Programming Languages", style: txtTheme.bodyMedium, overflow: TextOverflow.ellipsis), //bodyText2
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ), */
        ),
      ),
    );
  }
}