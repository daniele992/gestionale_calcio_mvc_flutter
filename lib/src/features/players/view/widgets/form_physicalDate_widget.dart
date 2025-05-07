import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FormPhysicalDateWidget extends ConsumerStatefulWidget {
  const FormPhysicalDateWidget({super.key});

  @override
  ConsumerState<FormPhysicalDateWidget> createState() =>
      _FormPhysicalDateWidget();
}

class _FormPhysicalDateWidget extends ConsumerState<FormPhysicalDateWidget> {

  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Card(
          elevation: 4,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: Colors.black),
          ),
          child: Container(
            width:MediaQuery.of(context).size.width * 0.75, // 60% height
            height: MediaQuery.of(context).size.height * 0.65, // 60% height
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nome'),
                ),
                SizedBox(height: 12),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Cognome'),
                ),
                SizedBox(height: 12),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Data di nascita'),
                ),
                SizedBox(height: 12),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Squadra appartenenza'),
                ),
                SizedBox(height: 12),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Nazionalità'),
                ),
              ],
            ),
          ),
        ),
       /* Positioned(
          left: 16,
          top: -12,
          child: Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              'Dati Fisici',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
        ), */
      ],
    );
  }
}
