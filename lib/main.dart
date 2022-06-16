import 'package:arrhythmia/screens/arrhythmia_screen.dart';
import 'package:arrhythmia/screens/home_screen.dart';
import 'package:arrhythmia/screens/types_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
      routes: {
        ArrhythmiaScreen.routName: (context) => const ArrhythmiaScreen(),
        TypesScreen.routName: (context) => const TypesScreen(),
        //ClassifyScreen.routName: (context) => const ClassifyScreen(),
      },
    );
  }
}
