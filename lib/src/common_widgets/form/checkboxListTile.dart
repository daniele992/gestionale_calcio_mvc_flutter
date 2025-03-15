import 'package:flutter/material.dart';
import 'package:gestionale_calcio_mvc_flutter/src/features/authentication/controllers/on_boarding_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../features/authentication/controllers/signup_controller.dart';

class FormCheckBoxListTile extends StatefulWidget {
  FormCheckBoxListTile ({
    super.key,
    required this.valueCheckBox,
    required this.textCheckBox,
    required this.iconCheckBox,

  });

  // Variables -- Declared in Constructor
  late  bool? valueCheckBox;
  final String textCheckBox;
  final IconData iconCheckBox;


  @override
  State<FormCheckBoxListTile> createState() => _FormCheckBoxListTileState();
}

class _FormCheckBoxListTileState extends State<FormCheckBoxListTile> {
  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        secondary: Icon(widget.iconCheckBox),
        value: widget.valueCheckBox,
        title: Text(widget.textCheckBox),
        side: BorderSide(color: widget.valueCheckBox == true ? Colors.green : Colors.red),
        activeColor: Colors.green,
        checkColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onChanged: (val) {
          setState(() {
            widget.valueCheckBox = val;
            print("Prova valore ${widget.valueCheckBox}");
          });
        },
        controlAffinity: ListTileControlAffinity.leading,
    );
  }
}

