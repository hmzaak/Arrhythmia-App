import 'dart:convert';

import 'package:tflite_flutter/tflite_flutter.dart';

class Classifier {
  // name of the model file
  final _modelFile = 'tf_lite_model.tflite';
  // final _vocabFile = 'text_classification_vocab.txt';

  // TensorFlow Lite Interpreter object
  late Interpreter _interpreter;

  Classifier() {
    // Load model when the classifier is initialized.
    _loadModel();
  }

  void _loadModel() async {
    // Creating the interpreter using Interpreter.fromAsset
    _interpreter = await Interpreter.fromAsset(_modelFile);
    print('Interpreter loaded successfully');
  }

  int classify(String rawText) {
    // tokenizeInputText returns List<List<double>>
    // of shape [1, 256].
    List<dynamic> lst = json.decode(rawText);
    List<List<double>> input = [[]];
    for (int i = 0; i < lst[0].length; i++) {
      input[0].add(lst[0][i]);
    }

    // output of shape [1,2].
    int? output;

    // The run method will run inference and
    // store the resulting values in output.
    _interpreter.run(input, output!);

    return output;
  }
}
