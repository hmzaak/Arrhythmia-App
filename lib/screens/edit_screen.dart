import 'dart:convert';
import 'dart:io';

import 'package:arrhythmia/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class EditScreen extends StatefulWidget {
  static const routname = '/edit-screen';
  const EditScreen({Key? key}) : super(key: key);

  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController? doctorNumber;
  TextEditingController? name;

  var _formKey = GlobalKey<FormState>();

  Directory? tempDir;
  File? jsonFile;
  var data = {};

  @override
  void initState() {
    //asycInit();
    super.initState();
  }

  @override
  void dispose() {
    doctorNumber!.dispose();
    name!.dispose();
    super.dispose();
  }

  Future<void> asycInit() async {
    tempDir = await getApplicationDocumentsDirectory();
    String _numberPath = tempDir!.path + '/number.json';
    jsonFile = File(_numberPath);
    if (jsonFile!.existsSync()) {
      data = json.decode(jsonFile!.readAsStringSync());
    }
    doctorNumber = TextEditingController(
      text: data.isEmpty ? '' : data['number'],
    );
    name = TextEditingController(
      text: data.isEmpty ? '' : data['name'],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit'),
      ),
      drawer: AppDrawer(),
      body: FutureBuilder(
          future: asycInit(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Center(
                child: Card(
                  margin: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextFormField(
                                decoration: InputDecoration(
                                  hintText: name!.text.isEmpty
                                      ? 'Patient Name'
                                      : name!.text,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(30),
                                    ),
                                  ),
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: 5,
                                    horizontal: 15,
                                  ),
                                ),
                                validator: (val) => val!.isEmpty
                                    ? 'Please enter the patient\'s name'
                                    : null,
                                controller: name),
                            const SizedBox(height: 10),
                            TextFormField(
                              decoration: InputDecoration(
                                hintText: doctorNumber!.text.isEmpty
                                    ? 'Doctor Phone number'
                                    : doctorNumber!.text,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30),
                                  ),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 5,
                                  horizontal: 15,
                                ),
                              ),
                              validator: (val) => val!.isEmpty
                                  ? 'Please enter the doctor\'s number'
                                  : null,
                              controller: doctorNumber,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  data['number'] = doctorNumber!.text;
                                  data['name'] = name!.text;
                                  jsonFile!
                                      .writeAsStringSync(json.encode(data));
                                }
                              },
                              child: Text('Save'),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}
