import 'package:flutter/material.dart';


///This is a helper class used to handle screen navigation. It can be called without creating an instance of the class.
///Example: TPageRoute.pageRoute(context, 500, const LoginScreen());
class TPageRoute {
  static pageRoute(BuildContext context, int durationInMS, dynamic className) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: durationInMS),
        pageBuilder: (_, __, ___) => className,
      ),
    );
  }
}
