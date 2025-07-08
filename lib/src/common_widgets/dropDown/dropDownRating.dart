import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropdownRating extends StatelessWidget {
  final double? selectedValue;
  final List<double> values;
  final void Function(double?) onChanged;
  final String label;
  final String hintText;

  const DropdownRating({
    super.key,
    required this.selectedValue,
    required this.values,
    required this.onChanged,
    required this.label,
    required this.hintText,

  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<double>(
      value: selectedValue,
      isExpanded: true,
      hint: Text(hintText),
      decoration: InputDecoration(labelText: label),
      items: values.map((value) {
        return DropdownMenuItem<double>(
            value: value, child: Text(value.toStringAsFixed(1)));
      }).toList(),
      onChanged: onChanged,
      validator: (value) => value  == null ? 'Seleziona un valore valido!' : null,
    );
  }
}

