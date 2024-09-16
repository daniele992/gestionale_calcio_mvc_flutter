import "package:flutter/material.dart";
import "package:gestionale_calcio_mvc_flutter/src/constants/colors.dart";
import "package:gestionale_calcio_mvc_flutter/src/constants/image_strings.dart";
import "package:gestionale_calcio_mvc_flutter/src/constants/sizes.dart";
import "package:gestionale_calcio_mvc_flutter/src/constants/text_strings.dart";
import "package:gestionale_calcio_mvc_flutter/src/features/core/view/dashboard/widgets/appbar.dart";

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

              //SearchBar
              Container(
                decoration: const BoxDecoration(border: Border(left: BorderSide(width: 4))),
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        tDashBoardSearch,
                        style: txtTheme.headlineMedium?.apply(color: Colors.grey.withOpacity(0.5))
                    ), //headline2
                    const Icon(Icons.mic, size: 25),
                  ],
                ),
              ),
              const SizedBox(height: tDashBoardPadding),

              //Categories
              SizedBox(
                height: 45,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
                      width: 170,
                      height: 50,
                      child: Row(
                        children: [
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: tDarkColor),
                            child: Text("JS", style: txtTheme.headlineSmall?.apply(color: Colors.white),),
                          ),
                          const SizedBox(width: 5),
                          Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Java Script", style: txtTheme.headlineSmall, overflow: TextOverflow.ellipsis),
                                  Text("10 Lessons", style: txtTheme.bodyMedium, overflow: TextOverflow.ellipsis),
                
                                ],
                              )
                          )
                
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 170,
                      height: 45,
                      child: Row(
                        children: [
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: tDarkColor),
                            child: Text("JS", style: txtTheme.headlineSmall?.apply(color: Colors.white),),
                          ),
                          const SizedBox(width: 5),
                          Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Java Script", style: txtTheme.headlineSmall, overflow: TextOverflow.ellipsis),
                                  Text("10 Lessons", style: txtTheme.bodyMedium, overflow: TextOverflow.ellipsis),

                                ],
                              )
                          )

                        ],
                      ),
                    ),
                    SizedBox(
                      width: 170,
                      height: 50,
                      child: Row(
                        children: [
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: tDarkColor),
                            child: Text("JS", style: txtTheme.headlineSmall?.apply(color: Colors.white),),
                          ),
                          const SizedBox(width: 5),
                          Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Java Script", style: txtTheme.headlineSmall, overflow: TextOverflow.ellipsis),
                                  Text("10 Lessons", style: txtTheme.bodyMedium, overflow: TextOverflow.ellipsis),

                                ],
                              )
                          )

                        ],
                      ),
                    ),
                    /*
                    SizedBox(
                      width: 170,
                      height: 50,
                      child: Row(
                        children: [
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: tDarkColor),
                            child: Text("JS", style: txtTheme.headlineSmall?.apply(color: Colors.white),),
                          ),
                          const SizedBox(width: 5),
                          Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Java Script", style: txtTheme.headlineSmall, overflow: TextOverflow.ellipsis),
                                  Text("10 Lessons", style: txtTheme.bodyMedium, overflow: TextOverflow.ellipsis),

                                ],
                              )
                          )

                        ],
                      ),
                    ),
                    SizedBox(
                      width: 170,
                      height: 50,
                      child: Row(
                        children: [
                          Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: tDarkColor),
                            child: Text("JS", style: txtTheme.headlineSmall?.apply(color: Colors.white),),
                          ),
                          const SizedBox(width: 5),
                          Flexible(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Java Script", style: txtTheme.headlineSmall, overflow: TextOverflow.ellipsis),
                                  Text("10 Lessons", style: txtTheme.bodyMedium, overflow: TextOverflow.ellipsis),

                                ],
                              )
                          )

                        ],
                      ),
                    ),
                   */


                  ],
                ),
              ),
              const SizedBox(height: tDashBoardPadding),

              //Banners
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Container(
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: tCardBgColor),
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(child: Image(image: AssetImage(tBookmarkIcon))),
                                  Flexible(child: Image(image: AssetImage(tBannerImage1))),
                                ],
                            ),
                            const SizedBox(height: 25),
                            Text(
                                tDashBoardBannerTitle1,
                                style: txtTheme.headlineMedium, ////HeadLine6
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis
                            ),
                            Text(
                                tDashBoardBannerSubTitle,
                                style: txtTheme.bodyMedium, //BodyText2
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis
                            ),
                          ],
                        ),
                      )
                  ),
                  const SizedBox(width: tDashBoardCardPadding),
                  Expanded(
                      child: Column(
                        children: [
                          Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: tCardBgColor),
                            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Flexible(child: Image(image: AssetImage(tBookmarkIcon))),
                                    Flexible(child: Image(image: AssetImage(tBannerImage2))),
                                  ],
                                ),
                                Text(
                                    tDashBoardBannerTitle2,
                                    style: txtTheme.headlineMedium, ////HeadLine6
                                    overflow: TextOverflow.ellipsis
                                ),
                                Text(
                                    tDashBoardBannerSubTitle,
                                    style: txtTheme.bodyMedium, //BodyText2
                                    overflow: TextOverflow.ellipsis
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: OutlinedButton(onPressed: (){}, child: const Text(tDashBoardButton)),
                          )
                        ],
                      )
                  )
                ],
              ),
              const SizedBox(height: tDashBoardPadding),

              //Top Course
              Text(tDashBoardTopCourses, style: txtTheme.headlineMedium?.apply(fontSizeFactor: 18 * 1.2)), //HeadLine4
              SizedBox(
                height: 200,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    SizedBox(
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
                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}

