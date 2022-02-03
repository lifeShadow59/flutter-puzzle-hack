import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';

abstract class FilePicker {
  Future<List<dynamic>> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? _image = await _picker.pickImage(source: ImageSource.gallery);
    if (_image != null) {
      return [await _image.readAsBytes(), _image];
    }
    return [];
  }
}
