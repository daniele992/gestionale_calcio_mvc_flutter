import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropDownLanguage extends StatefulWidget  {
  const DropDownLanguage({ super.key });

  @override
  State<DropDownLanguage> createState() => _DropDownLanguage();

} //End Class DropDownLanguage




class _DropDownLanguage extends State<DropDownLanguage> {

  String _selected = '';
  final List<Map> _myJson = [
    {
      'id': '1',
      'image': 'assets/images/flags/england/FlagEngland_Round.png',
      'name': 'English'
    },
    {
      'id': '2',
      'image': 'assets/images/flags/france/FlagFrance_Round.png',
      'name': 'French'
    },
    {
      'id': '3',
      'image': 'assets/images/flags/italian/FlagItaly_Circle.png',
      'name': 'Italian'
    },
  ];

    @override
    Widget build(BuildContext context) {
      return Container(
        child: DropdownButtonHideUnderline(
          child: ButtonTheme(
            alignedDropdown: true,
            child: DropdownButton(
              hint: Text('Select Language'),
              value: _selected,
              onChanged: (newValue) {
                setState(() {
                  _selected = newValue.toString();
                });
              },
              items: _myJson.map((itemFlag) {
                return DropdownMenuItem(
                  value: itemFlag['id'].toString(),
                  child: Row(
                    children: [
                      Image.asset(
                        itemFlag['image'],
                        width: 25,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Text(itemFlag['name']),
                      )
                    ],
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      );
    }
  } // END _DropDownLanguage

