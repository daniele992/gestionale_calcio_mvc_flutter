import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/text_strings.dart';

class DropdownRating extends StatelessWidget {
  final double? selectedValue;
  final List<double> values;
  final void Function(double?) onChanged;
  final String label;
  final String hintText;
  final IconData icon;
  final List<String> textDialog;

  const DropdownRating({
    super.key,
    required this.selectedValue,
    required this.values,
    required this.onChanged,
    required this.label,
    required this.hintText,
    required this.icon,
    required this.textDialog,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<double>(
      value: selectedValue,
      isExpanded: true,
      hint: Text(hintText),
      decoration: InputDecoration(
          labelText: label,
          prefixIcon: IconButton(
            icon: Icon(icon),
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Align(
                    alignment: Alignment.center,
                    child: Text('INFORMAZIONI'),
                  ),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ...textDialog.map((item) => Text(
                            item,
                            style: GoogleFonts.montserrat(
                              fontSize: 8,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          )),
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text('OK'),
                    ),
                  ],
                ),
              );
            },
          )),
      items: values.map((value) {
        return DropdownMenuItem<double>(
            value: value, child: Text(value.toStringAsFixed(1)));
      }).toList(),
      onChanged: onChanged,
      validator: (value) =>
          value == null ? 'Seleziona un valore valido!' : null,
    );
  }
}
