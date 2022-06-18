import 'package:arrhythmia/screens/arrhythmia_screen.dart';
import 'package:arrhythmia/screens/home_screen.dart';
import 'package:arrhythmia/screens/splash_screen.dart';
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
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color(0xFFD9494B),
        ),
      ),
      home: const SplashScreen(),
      routes: {
        ArrhythmiaScreen.routName: (context) => ArrhythmiaScreen(),
        TypesScreen.routName: (context) => TypesScreen(),
        HomeScreen.routname: (context) => const HomeScreen(),
      },
    );
  }
}
