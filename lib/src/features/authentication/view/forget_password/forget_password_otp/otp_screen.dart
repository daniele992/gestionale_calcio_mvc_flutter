import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:gestionale_calcio_mvc_flutter/src/constants/sizes.dart';
import 'package:gestionale_calcio_mvc_flutter/src/constants/text_strings.dart';
import 'package:gestionale_calcio_mvc_flutter/src/features/authentication/controllers/otp_controller.dart';
import 'package:google_fonts/google_fonts.dart';

///This screen is a simple interface for entering an OTP code and verifying it, both immediately after finishing typing and by pressing a button. The actual verification of the code’s validity is delegated to the OTPController.
class OTPScreen extends StatelessWidget {
  const OTPScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String otp = '';

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(tDefaultSpace),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(tOtpTitle,
                style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.bold, fontSize: 80.0)),
            Text(tOtpSubTitle.toUpperCase(),
                style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 40.0),
            const Text("$tOtpMessage support@codingwitht.com",
                textAlign: TextAlign.center),
            const SizedBox(height: 20.0),
            OtpTextField(
              mainAxisAlignment: MainAxisAlignment.center,
              numberOfFields: 6,
              fillColor: Colors.black.withOpacity(0.1),
              filled: true,
              onSubmit: (code) {
                otp = code;
                OTPController.instance.verifyOTP(otp);
              },
            ),
            const SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    OTPController.instance.verifyOTP(otp);
                  },
                  child: const Text(tNext)),
            ),
          ],
        ),
      ),
    );
  }
}
