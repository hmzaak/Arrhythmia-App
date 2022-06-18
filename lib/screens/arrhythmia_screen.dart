import 'package:arrhythmia/data/about_arrhythmia.dart';
import 'package:arrhythmia/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class ArrhythmiaScreen extends StatelessWidget {
  static const routName = '/arrhythmia-screen';
  ArrhythmiaScreen({Key? key}) : super(key: key);

  final arrData = AboutArrhythmia();

  Widget buildLongText(String paragraph) {
    return Text(
      paragraph,
      textAlign: TextAlign.justify,
      overflow: TextOverflow.visible,
    );
  }

  Widget buildBulletString(String bullet) {
    return Container(
      padding: const EdgeInsets.only(left: 25),
      alignment: Alignment.topLeft,
      child: Text(
        bullet,
        textAlign: TextAlign.justify,
        overflow: TextOverflow.visible,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('About Arrhythmia'),
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                arrData.mainHeading,
                style: const TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              buildLongText(arrData.firstParagraph),
              const SizedBox(height: 10),
              buildLongText(arrData.secondParagraph),
              const SizedBox(height: 10),
              buildLongText(arrData.thirdParaghraph),
              const SizedBox(height: 10),
              buildLongText(arrData.fourthParagraph),
              const SizedBox(height: 30),
              const Align(
                alignment: Alignment.topLeft,
                child: Text('Symptoms of Arrhythmia include: '),
              ),
              const SizedBox(height: 10),
              buildBulletString(arrData.firstSymptom),
              buildBulletString(arrData.secondSymptom),
              buildBulletString(arrData.thirdSymptom),
              buildBulletString(arrData.forthSymptom),
              buildBulletString(arrData.fifthSymptom),
              buildBulletString(arrData.sixthSymptom),
              const SizedBox(height: 10),
              Image.asset(
                'assets/heartPic.jpeg',
                width: 300,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
