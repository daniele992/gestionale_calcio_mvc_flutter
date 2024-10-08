import 'package:flutter/material.dart';

import '../../constants/image_strings.dart';
import '../../constants/text_strings.dart';

class SignUpFooterWidget extends StatelessWidget{
  const SignUpFooterWidget ({ super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("OR"),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: (){},
            icon: const Image(
                image: AssetImage(tGoogleLogoImage),
                width:  20.0),
            label: Text(tSignInWithGoogle.toUpperCase()),
          ),
        ),
        TextButton(
          onPressed: (){},
          child: Text.rich(
              TextSpan(
                  children: [
                    TextSpan(text: tAlreadyHaveAnAccount, style: Theme.of(context).textTheme.bodyLarge), //bodyText1?
                    TextSpan(text: tLogin.toUpperCase())
                  ]
              )
          ),
        )
      ],
    );
  }
}