import 'package:arrhythmia/screens/classify_screen.dart';
import 'package:arrhythmia/tflite/classifier.dart';
import 'package:arrhythmia/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Classifier _classifier;

  @override
  void initState() {
    super.initState();
    _classifier = Classifier();
  }
  // File? csvFile;

  // void getCsvFile() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     type: FileType.custom,
  //     allowedExtensions: ['csv'],
  //     allowMultiple: false,
  //   );
  //   if (result != null) {
  //     csvFile = File(result.files.first.path!);
  //     var input = csvFile!.openRead();
  //     var fields = await input
  //         .transform(utf8.decoder)
  //         .transform(const CsvToListConverter())
  //         .toList();

  //     print(fields);
  //   } else {
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       const SnackBar(
  //           content: Text('File not Picked'), backgroundColor: Colors.red),
  //     );
  //   }
  // }

  TextEditingController ecg = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arrythmia Detection'),
      ),
      drawer: const AppDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(10),
              height: 160,
              width: 300,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.grey),
              ),
              child: Center(
                child: Lottie.asset(
                  './assets/lf30_editor_beoq0rya.json',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          TextField(
            maxLines: 5,
            decoration: const InputDecoration(
              hintText: 'Paste ECG values here',
              contentPadding: EdgeInsets.only(left: 10),
            ),
            controller: ecg,
          ),
          const SizedBox(height: 30),
          ElevatedButton.icon(
            onPressed: () {
              if (ecg.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Please enter ECG Values',
                      textAlign: TextAlign.center,
                    ),
                    backgroundColor: Colors.red,
                  ),
                );
                return;
              }
              final prediction = _classifier.classify(ecg.text);
              var maxVal = 0.0;
              for (int i = 0; i < prediction[0].length; i++) {
                if (prediction[0][i] > maxVal) {
                  maxVal = prediction[0][i];
                }
              }
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (ctx) => ClassifyScreen(
                    index: prediction[0].indexOf(maxVal),
                  ),
                ),
              );
            },
            icon: const Icon(Icons.wifi_protected_setup),
            label: const Text('Classify'),
            style: ElevatedButton.styleFrom(
              minimumSize: const Size(200, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
