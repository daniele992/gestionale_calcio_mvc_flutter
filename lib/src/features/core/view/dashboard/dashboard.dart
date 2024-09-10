import "package:flutter/material.dart";
import "package:gestionale_calcio_mvc_flutter/src/constants/colors.dart";
import "package:gestionale_calcio_mvc_flutter/src/constants/image_strings.dart";
import "package:gestionale_calcio_mvc_flutter/src/constants/sizes.dart";
import "package:gestionale_calcio_mvc_flutter/src/constants/text_strings.dart";

class Dashboard extends StatelessWidget{
  const  Dashboard({Key? key}) : super(key:key);

  @override
  Widget build(BuildContext context)
  {
    final txtTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu, color: Colors.black),
        title: Text(tAppName, style: Theme.of(context).textTheme.headlineSmall), //Headline4?
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20, top: 7),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: tCardBgColor),
            child: IconButton(onPressed: (){}, icon: const Image(image: AssetImage(tUserProfileImage))),
          )
        ],
      ),
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
              const SizedBox(height: tDashBoardPadding)
            ],
          ),
        ),
      ),
    );
  }
}