import 'package:tflite_flutter/tflite_flutter.dart';

class TflitePredictor{
  Future<void> predict(List<int> audioChunk) async {
    var output = [];
    final interpreter = await Interpreter.fromAsset('assets/converted_model.tflite');
    final outputShape = interpreter.getOutputTensor(0).shape;
    output = List.filled(outputShape.reduce((a, b) => a * b), 0);
    interpreter.run(audioChunk, output);
    print("Output :: $output");
  }
}

