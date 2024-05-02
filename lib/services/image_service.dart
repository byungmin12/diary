import 'dart:io';

import 'package:diary/services/segmentation_service.dart';
import 'package:image_picker/image_picker.dart';

class ImageService {
  final ImagePicker _picker;
  final List<XFile?> _pickedImages = [];
  final segmentation = SegmentationService();

  ImageService({required ImagePicker picker}) : _picker = picker;

  void addImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(source: source);
    await segmentation.loadModel();
    File file = File(image?.path ?? "");
    segmentation.segmentImage(file);
    _pickedImages.add(image);
  }

  List<XFile?> getImage() => _pickedImages;
}
