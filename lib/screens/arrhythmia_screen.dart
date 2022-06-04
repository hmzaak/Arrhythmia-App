import 'package:arrhythmia/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class ArrhythmiaScreen extends StatelessWidget {
  static const routName = '/arrhythmia-screen';
  const ArrhythmiaScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Arrhythmia'),
      ),
      drawer: const AppDrawer(),
      body: const Center(
        child: Text('Arrhythmia Screen'),
      ),
    );
  }
}
