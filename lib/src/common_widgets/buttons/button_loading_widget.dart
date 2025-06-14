import 'package:flutter/material.dart';

///This class displays a row with a small loading circle and the text 'Loading...'.
class ButtonLoadingWidget extends StatelessWidget {
  const ButtonLoadingWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 20,
          height: 20,
          child: CircularProgressIndicator(color: Colors.white),
        ),
        SizedBox(width: 10),
        Text("Loading...")
      ],
    );
  }
}
