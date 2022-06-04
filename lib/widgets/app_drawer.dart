import 'package:arrhythmia/screens/arrhythmia_screen.dart';
import 'package:arrhythmia/screens/types_screen.dart';
import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            title: const Text('LOGO here..'),
            automaticallyImplyLeading: false,
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home Page'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.abc),
            title: const Text('Arrhythmia'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(ArrhythmiaScreen.routName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.table_rows_rounded),
            title: const Text('Types'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(TypesScreen.routName);
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
