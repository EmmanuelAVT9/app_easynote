// widgets/hamburger_menu.dart
import 'package:flutter/material.dart';

class HamburgerMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('Menú'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          ListTile(
            title: Text('Notas'),
            onTap: () {
              // Navegar a la vista de notas
            },
          ),
          ListTile(
            title: Text('Carpetas'),
            onTap: () {
              // Navegar a la vista de carpetas
            },
          ),
        ],
      ),
    );
  }
}
