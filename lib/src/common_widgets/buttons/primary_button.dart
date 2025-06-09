import 'package:flutter/material.dart';
import 'package:gestionale_calcio_mvc_flutter/src/common_widgets/buttons/button_loading_widget.dart';

///This class displays a custom button that: Can be full width or have a fixed width. Can show a loading indicator instead of the text.
///Can be disabled if the user has not accepted the privacy policy or terms (if specified). Displays the text in uppercase.
class TPrimaryButton extends StatelessWidget {
  const TPrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
    this.isFullWidth = true,
    this.width = 100.0,
    this.privacyPolicy,
    this.acceptTerms,
  });

  final String text;
  final VoidCallback onPressed;
  final bool isLoading;
  final bool isFullWidth;
  final double width;
  final bool? privacyPolicy;
  final bool? acceptTerms;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: isFullWidth ? double.infinity : width,
      child: ElevatedButton(
        onPressed:
            privacyPolicy == false || acceptTerms == false ? null : onPressed,
        child:
            isLoading ? const ButtonLoadingWidget() : Text(text.toUpperCase()),
      ),
    );
  }
}
