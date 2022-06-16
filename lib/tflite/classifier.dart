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
  }

  List classify(String rawText) {
    // tokenizeInputText returns List<List<double>>
    // of shape [1, 256].
    List<dynamic> input = json.decode(rawText);
    input = input.reshape([1, 186, 1]);

    // var input = [
    //   [
    //     1.00E+00,
    //     8.22E-01,
    //     2.21E-01,
    //     9.16E-02,
    //     8.91E-02,
    //     2.34E-01,
    //     3.10E-01,
    //     2.60E-01,
    //     2.04E-01,
    //     3.23E-01,
    //     2.16E-01,
    //     2.65E-01,
    //     2.52E-01,
    //     2.24E-01,
    //     2.62E-01,
    //     3.10E-01,
    //     3.38E-01,
    //     2.77E-01,
    //     3.08E-01,
    //     3.18E-01,
    //     3.82E-01,
    //     4.22E-01,
    //     3.44E-01,
    //     4.05E-01,
    //     4.25E-01,
    //     4.76E-01,
    //     4.73E-01,
    //     4.43E-01,
    //     4.30E-01,
    //     3.89E-01,
    //     3.46E-01,
    //     3.72E-01,
    //     3.77E-01,
    //     3.82E-01,
    //     3.66E-01,
    //     3.10E-01,
    //     3.08E-01,
    //     3.00E-01,
    //     3.33E-01,
    //     3.49E-01,
    //     3.13E-01,
    //     3.10E-01,
    //     3.26E-01,
    //     3.87E-01,
    //     3.31E-01,
    //     3.41E-01,
    //     2.90E-01,
    //     3.36E-01,
    //     3.54E-01,
    //     3.08E-01,
    //     3.49E-01,
    //     4.53E-01,
    //     2.60E-01,
    //     3.18E-01,
    //     3.44E-01,
    //     3.44E-01,
    //     3.28E-01,
    //     3.38E-01,
    //     3.00E-01,
    //     3.03E-01,
    //     3.54E-01,
    //     3.46E-01,
    //     3.64E-01,
    //     3.99E-01,
    //     3.16E-01,
    //     1.60E-01,
    //     2.70E-01,
    //     2.26E-01,
    //     2.32E-01,
    //     2.60E-01,
    //     3.08E-01,
    //     2.93E-01,
    //     2.67E-01,
    //     2.80E-01,
    //     5.75E-01,
    //     8.96E-01,
    //     7.56E-01,
    //     2.54E-01,
    //     0.00E+00,
    //     9.92E-02,
    //     2.26E-01,
    //     2.52E-01,
    //     2.34E-01,
    //     2.01E-01,
    //     2.32E-01,
    //     2.19E-01,
    //     3.46E-01,
    //     2.34E-01,
    //     2.11E-01,
    //     2.39E-01,
    //     3.00E-01,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00,
    //     0.00E+00
    //   ]
    // ].reshape([1, 186, 1]);

    // if output tensor shape [1,2] and type is float32
    var output = List.filled(1 * 5, 0).reshape([1, 5]);

    // output of shape [1,2].
    //int output;

    // The run method will run inference and
    // store the resulting values in output.
    _interpreter.run(input, output);

    return output;
  }
}
