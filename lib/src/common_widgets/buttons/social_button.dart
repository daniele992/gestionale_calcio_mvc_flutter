import 'package:flutter/material.dart';
import 'button_loading_widget.dart';


///It is a full-width button with: An icon on the left (image from assets). A text label. It can show a loading indicator instead of the text and icon.
///It has custom colors for the text/icon and background. The function is executed when the button is pressed.
class TSocialButton extends StatelessWidget {
  const TSocialButton({
    super.key,
    required this.text,
    required this.image,
    this.isLoading = false,
    required this.foreground,
    required this.background,
    required this.onPressed,
  });

  final String text;
  final String image;
  final Color foreground, background;
  final VoidCallback onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          foregroundColor: foreground,
          backgroundColor: background,
          side: BorderSide.none,
        ),
        icon: isLoading
            ? const SizedBox()
            : Image(image: AssetImage(image), width: 24, height: 24),
        label: isLoading
            ? const ButtonLoadingWidget()
            : Text(text,
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .apply(color: foreground)),
      ),
    );
  }
}
