import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/text_strings.dart';


///It is a widget that creates a horizontal row composed of two dividing lines (Divider) with the text "OR" (or tOR) in the center.
///It is used to visually separate sections of a form, for example between two login methods.
class TFormDividerWidget extends StatelessWidget {
  const TFormDividerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    return Row(
      children: [
        Flexible(
            child: Divider(
                thickness: 1,
                indent: 50,
                color: Colors.grey.withOpacity(0.3),
                endIndent: 10)),
        Text(tOR,
            style: Theme.of(context).textTheme.bodyLarge!.apply(
                color: isDark
                    ? tWhiteColor.withOpacity(0.5)
                    : tDarkColor.withOpacity(0.5))),
        Flexible(
            child: Divider(
                thickness: 1,
                indent: 10,
                color: Colors.grey.withOpacity(0.3),
                endIndent: 50)),
      ],
    );
  }
}
