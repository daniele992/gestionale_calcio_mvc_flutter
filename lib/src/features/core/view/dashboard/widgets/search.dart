import 'package:flutter/material.dart';
import '../../../../../constants/text_strings.dart';

class DashboardSearchBox extends StatelessWidget {
  const DashboardSearchBox({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          const BoxDecoration(border: Border(left: BorderSide(width: 4))),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(tDashBoardSearch,
              style: txtTheme.displayMedium
                  ?.apply(color: Colors.grey.withOpacity(0.5))), //headline2
          const Icon(Icons.mic, size: 25),
        ],
      ),
    );
  }
}
