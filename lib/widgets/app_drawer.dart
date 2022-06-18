import 'package:arrhythmia/screens/arrhythmia_screen.dart';
import 'package:arrhythmia/screens/edit_screen.dart';
import 'package:arrhythmia/screens/home_screen.dart';
import 'package:arrhythmia/screens/types_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 140,
            padding: const EdgeInsets.only(top: 50),
            //decoration: BoxDecoration(border: Border.all()),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                FaIcon(
                  FontAwesomeIcons.heartPulse,
                  color: Colors.red,
                ),
                Text(
                  'Arrhythmia Detection',
                  style: TextStyle(fontSize: 20),
                )
              ],
            ),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(
              Icons.home,
              color: Colors.red,
            ),
            title: const Text('Home Page'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(HomeScreen.routname);
            },
          ),
          const Divider(),
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.heartPulse,
              color: Colors.red,
            ),
            title: const Text('Arrhythmia'),
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(ArrhythmiaScreen.routName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.list,
              color: Colors.red,
            ),
            title: const Text('Types'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(TypesScreen.routName);
            },
          ),
          const Divider(),
          ListTile(
            leading: const FaIcon(
              FontAwesomeIcons.pen,
              color: Colors.red,
            ),
            title: const Text('Edit'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed(EditScreen.routname);
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}
