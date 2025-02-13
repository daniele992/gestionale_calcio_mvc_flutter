import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class dropDownLang extends StatefulWidget {
  const dropDownLang({ super.key,

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
              MenuItems.onChanged(context, value! as MenuItem);
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
  final IconData icon;
}

abstract class MenuItems {
  static const List<MenuItem> firstItems = [home, share, settings];
  static const List<MenuItem> secondItems = [logout];

  static const home = MenuItem(text: 'EN', icon: Icons.home);
  static const share = MenuItem(text: 'IT', icon: Icons.share);
  static const settings = MenuItem(text: 'FR', icon: Icons.settings);
  static const logout = MenuItem(text: 'Log Out', icon: Icons.logout);

  static Widget buildItem(MenuItem item) {
    return Row(
      children: [
        Icon(item.icon, color: Colors.white, size: 22),
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

  static void onChanged(BuildContext context, MenuItem item) {
    switch (item) {
      case MenuItems.home:
      //Do something
        break;
      case MenuItems.settings:
      //Do something
        break;
      case MenuItems.share:
      //Do something
        break;
      case MenuItems.logout:
      //Do something
        break;
    }
  }
}

