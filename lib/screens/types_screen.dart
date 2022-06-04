import 'package:arrhythmia/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class TypesScreen extends StatelessWidget {
  static const routName = '/types-screen';
  const TypesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arrhythmia Types'),
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text('Types-screen..'),
      ),
    );
  }
}
