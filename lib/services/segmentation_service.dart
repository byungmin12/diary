import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:image/image.dart' as img;
import 'package:image/image.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

class SegmentationService {
  late Interpreter _interpreter;

  Future<void> loadModel() async {
    // 모델 로드
    _interpreter = await Interpreter.fromAsset('assets/segmentation.tflite');
  }

  void segmentImage(File imageFile) async {
    // 이미지 파일을 img.Image 형식으로 로드
    img.Image image = img.decodeImage(imageFile.readAsBytesSync())!;

    // 이미지 전처리 (예: 크기 조정, 정규화 등)
    img.Image resizedImage =
        img.copyResize(image, width: image.width, height: image.height);
    // 이미지를 모델 입력 형식에 맞게 변환
    print('Image');

    var input = imageToByteListFloat32(resizedImage, 257, 127.5, 127.5);
    print('input');
    // 모델 실행을 위한 출력 버퍼 준비
    var output = List.filled(1 * image.width * image.height * 21, 0)
        .reshape([1, image.width, image.height, 21]);
    print('output');

    // 모델 실행
    _interpreter.run(input, output);

    // 결과 처리 및 세그멘테이션 마스크 생성
    // 이 부분은 모델과 애플리케이션의 요구에 따라 다를 수 있습니다.
    print(output[0]);
  }

  Uint8List imageToByteListFloat32(
      img.Image image, int inputSize, double mean, double std) {
    var convertedBytes = Float32List(1 * inputSize * inputSize * 3);
    final decodedBytes = image.getBytes(order: ChannelOrder.rgb);

    return decodedBytes;
  }
}
