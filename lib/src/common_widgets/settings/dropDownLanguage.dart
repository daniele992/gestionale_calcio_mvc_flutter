import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropDownLanguage extends StatelessWidget {
  const DropDownLanguage({
    super.key,
  });

  String _selected;
  List<Map> _myJson = [
    {
      'id': '1',
      '': 'assets/images/flags/england/FlagEngland_Round.png',
      'name': 'English'
    },
    {
      'id': '2',
      '': 'assets/images/flags/france/FlagFrance_Round.png',
      'name': 'French'
    },
    {
      'id': '3',
      '': 'assets/images/flags/italian/FlagItaly_Circle.png',
      'name': 'Italian'
    },
  ];

  @override
  Widget build(BuildContext context){
    return Container(
      child: DropdownButtonHideUnderline(
        child: ButtonTheme(
          alignedDropdown: true,
          child: DropdownButton(
            hint: Text('Select Language'),
            value: _selected,
          ),
        ),
      ),
    );
  }

} //End Class DropDownLanguage