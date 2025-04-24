import 'package:country_flags/country_flags.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class dropDownLang extends StatefulWidget {
  const dropDownLang({
    super.key,
    required this.colorDropDown,
    required this.sized,
    required this.colorInternalDropDown,
  });

  // Variables -- Declared in Constructor
  final Color colorDropDown;
  final double sized;
  final Color colorInternalDropDown;

  @override
  State<dropDownLang> createState() => _DropDownLang();
}

class _DropDownLang extends State<dropDownLang> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonHideUnderline(
      child: DropdownButton2(
        alignment: AlignmentDirectional.topEnd,
        customButton: Icon(
          Icons.list,
          size: widget.sized,
          color: widget.colorDropDown,
        ),
        items: [
          ...MenuItems.firstItems.map(
            (item) => DropdownMenuItem<MenuItem>(
              value: item,
              child: MenuItems.buildItem(item),
            ),
          ),
          const DropdownMenuItem<Divider>(enabled: false, child: Divider()),
          ...MenuItems.secondItems.map(
            (item) => DropdownMenuItem<MenuItem>(
              value: item,
              child: MenuItems.buildItem(item),
            ),
          ),
        ],
        onChanged: (value) {
          //MenuItems.onChanged(context, value! as MenuItem);
        },
        dropdownStyleData: DropdownStyleData(
          width: 160,
          padding: const EdgeInsets.symmetric(vertical: 6),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            color: widget.colorInternalDropDown,
          ),
          offset: const Offset(0, 8),
        ),
        menuItemStyleData: MenuItemStyleData(
          customHeights: [
            ...List<double>.filled(MenuItems.firstItems.length, 48),
            8,
            ...List<double>.filled(MenuItems.secondItems.length, 48),
          ],
          padding: const EdgeInsets.only(left: 16, right: 16),
        ),
      ),
    );
  }
}

class MenuItem {
  const MenuItem({
    required this.text,
    required this.icon,
  });

  final String text;
  final CountryFlag icon;
}

abstract class MenuItems {
  static List<MenuItem> firstItems = [home, share, settings];
  static List<MenuItem> secondItems = [logout];

  static double flagsHeight = 45;
  static double flagsWidth = 45;
  static const double radiousFlags = 4;

  static var home = MenuItem(
      text: 'EN',
      icon: CountryFlag.fromCountryCode('GB-ENG',
          shape: RoundedRectangle(radiousFlags),
          height: flagsHeight,
          width: flagsWidth));
  static var share = MenuItem(
      text: 'IT',
      icon: CountryFlag.fromCountryCode('IT',
          shape: RoundedRectangle(radiousFlags),
          height: flagsHeight,
          width: flagsWidth));
  static var settings = MenuItem(
      text: 'FR',
      icon: CountryFlag.fromCountryCode('ES',
          shape: RoundedRectangle(radiousFlags),
          height: flagsHeight,
          width: flagsWidth));
  static var logout = MenuItem(
      text: 'Log Out',
      icon: CountryFlag.fromCountryCode('ES',
          shape: RoundedRectangle(radiousFlags),
          height: flagsHeight,
          width: flagsWidth));

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        item.icon,
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Text(
            item.text,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
