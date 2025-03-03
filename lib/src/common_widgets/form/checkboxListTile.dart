import 'package:flutter/material.dart';

class FormCheckBoxListTile extends StatefulWidget {
  FormCheckBoxListTile ({
    super.key,
    required this.valueCheckBox,
    required this.textCheckBox,
    required this.iconCheckBox,

  });

  // Variables -- Declared in Constructor
  late  bool valueCheckBox;
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
            widget.valueCheckBox = val!;
          });
        },
        controlAffinity: ListTileControlAffinity.leading,
    );
  }
}

