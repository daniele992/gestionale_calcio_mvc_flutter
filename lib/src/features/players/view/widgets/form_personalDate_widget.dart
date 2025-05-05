import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FormPersonalDateWidget extends ConsumerStatefulWidget {
  const FormPersonalDateWidget({super.key});

  @override
  ConsumerState<FormPersonalDateWidget> createState() =>
      _FormPersonalDateWidget();
}

class _FormPersonalDateWidget extends ConsumerState<FormPersonalDateWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          decoration: InputDecoration(labelText: 'Nome'),
        ),
        SizedBox(height: 12),
        TextField(
          decoration: InputDecoration(labelText: 'Cognome'),
        ),
        SizedBox(height: 12),
        TextField(
          decoration: InputDecoration(labelText: 'Data'),
        ),
        SizedBox(height: 12),
        TextField(
          decoration: InputDecoration(labelText: 'Email'),
        ),
        SizedBox(height: 12),
        TextField(
          decoration: InputDecoration(labelText: 'Email'),
        ),
        // Aggiungi altri campi qui se necessario
      ],
    );
  }
}
