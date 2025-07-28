import 'package:flutter/material.dart';

///Section title in bold (e.g. "PERSONAL DATA")
Widget sectionTitle(
  String title, {
    //Parametri opzionali e nominati
  Color color = Colors.black,
  double fontSize = 14,
  FontWeight fontWeight = FontWeight.bold,
  IconData? icon,
}) {
  return Row(
    children: [
      if (icon != null) Icon(icon, size: fontSize + 2, color: color),
      if (icon != null)
        const SizedBox(
          width: 6,
        ),
      Text(
        title,
        style: TextStyle(
          fontWeight: fontWeight,
          fontSize: fontSize,
          color: color,
        ),
      ),
    ],
  );
}

/// Row with label + value (e.g. "Name: Mario")
Widget dataLine(
    String label,
    String? value, {
      Color? color,
      double fontSize = 13,
      FontWeight fontWeight = FontWeight.normal,
      IconData? icon,
    }) {
  final isMissing = value == null || value.trim().isEmpty;
  final displayValue = isMissing ? 'da inserire' : value!;
  final textColor = color ?? (isMissing ? Colors.red : Colors.black87);

  return Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      if (icon != null)
        Icon(icon, size: fontSize + 2, color: textColor),
      if (icon != null) const SizedBox(width: 6),
      Expanded(
        child: RichText(
          text: TextSpan(
            style: TextStyle(fontSize: fontSize, color: textColor),
            children: [
              TextSpan(
                text: '$label: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
              TextSpan(
                text: displayValue,
                style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: textColor,
                ),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
