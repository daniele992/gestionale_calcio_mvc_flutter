import 'package:flutter/material.dart';
import 'package:gestionale_calcio_mvc_flutter/src/features/authentication/controllers/on_boarding_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../features/authentication/controllers/signup_controller.dart';

class FormCheckBoxListTile extends StatefulWidget {
  FormCheckBoxListTile ({
    super.key,
    required this.initialValue,
    required this.textCheckBox,
    required this.iconCheckBox,
    required this.subTitle,
    required this.onChanged,
  });

  // Variables -- Declared in Constructor
  late  bool initialValue;
  final String textCheckBox;
  final IconData iconCheckBox;
  final String subTitle;
  final ValueChanged<bool> onChanged; // Callback for return the value

  @override
  State<FormCheckBoxListTile> createState() => _FormCheckBoxListTileState();
}

class _FormCheckBoxListTileState extends State<FormCheckBoxListTile> {

  late bool _isChecked;

  @override
  void initState() {
    super.initState();
    _isChecked = widget.initialValue;
  }

  @override
  Widget build(BuildContext context) {
    return CheckboxListTile(
        secondary: Icon(widget.iconCheckBox),
        value: _isChecked,
        title: Text(
            widget.textCheckBox,
            textAlign: TextAlign.left,
            textDirection: TextDirection.rtl,
        ),
        side: BorderSide(
            color: _isChecked == true
                ? Colors.green
                : Colors.red
        ),
        activeColor: Colors.green,
        checkColor: Colors.white,
        subtitle: Text(
            _isChecked == false
                ? widget.subTitle
                : ''
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        onChanged: (val) {
          setState(() {
            _isChecked = val!;
            widget.onChanged(_isChecked); // Passa il valore al widget padre
          });
          widget.onChanged(_isChecked); // Passa il valore al widget padre
        },
        controlAffinity: ListTileControlAffinity.leading,

    );
  }
}

