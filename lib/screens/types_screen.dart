import 'package:arrhythmia/data/types.dart';
import 'package:arrhythmia/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class TypesScreen extends StatelessWidget {
  static const routName = '/types-screen';
  TypesScreen({Key? key}) : super(key: key);

  final types = Types();

  Widget buildHeading(String heading) {
    return Align(
      alignment: Alignment.topLeft,
      child: Text(
        heading,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arrhythmia Types'),
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              buildHeading('Normal Beat: '),
              const SizedBox(height: 10),
              Text(
                types.normalBeat,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),
              buildHeading('Supraventricular Premature Beat:'),
              const SizedBox(height: 10),
              Text(
                types.supraVen,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),
              buildHeading('Premature Ventricular Contraction:'),
              const SizedBox(height: 10),
              Text(
                types.preMatureVen,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),
              buildHeading('Fusion of Ventricular and Normal Beat:'),
              const SizedBox(height: 10),
              Text(
                types.fusionVen,
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 20),
              buildHeading('Unclassifiable Beat:'),
              const SizedBox(height: 10),
              Text(
                types.unClassifiedBeat,
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
