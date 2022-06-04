import 'package:flutter/material.dart';

class ClassifyScreen extends StatelessWidget {
  static const routName = '/classify-screen';
  const ClassifyScreen({Key? key}) : super(key: key);

  Widget buildButton(String buttonName) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(200, 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      child: Text(buttonName),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Classify'),
      ),
      body: Center(
        child: SizedBox(
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildButton('Type 1'),
              buildButton('Type 2'),
              buildButton('Type 3'),
              buildButton('Type 4'),
              buildButton('Type 5'),
              buildButton('Type 6'),
            ],
          ),
        ),
      ),
    );
  }
}
