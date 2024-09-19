import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../../constants/colors.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';

class DashboardBanners extends StatelessWidget {
  const DashboardBanners({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
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
                     const Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
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
    );
  }
}