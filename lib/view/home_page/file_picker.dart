import 'dart:typed_data';
import 'package:image/image.dart' as imglib;
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';

abstract class FilePicker {
  Future<List<Image>?> pickImage() async {
    final ImagePicker _picker = ImagePicker();
    XFile? _image = await _picker.pickImage(source: ImageSource.gallery);
    if (_image != null) {
      List<int> fileBytes = await _image.readAsBytes();
      try {
        List<Image>? images = splitImage(fileBytes);
        if (images != null) {
          return images;
        }
        return null;
      } catch (error) {
        debugPrint("catch error $error");
        return null;
      }
    } else {
      debugPrint("null");
      return null;
    }
  }

  List<Image>? splitImage(List<int> input) {
    // convert image to image from image package
    imglib.Image? image = imglib.decodeImage(input);
    if (image == null) return null;
    int x = 0, y = 0;
    int width = (image.width / 3).round();
    int height = (image.height / 3).round();

    // split image to parts
    List<imglib.Image> parts = <imglib.Image>[];
    for (int i = 0; i < 3; i++) {
      for (int j = 0; j < 3; j++) {
        parts.add(imglib.copyCrop(image, x, y, width, height));
        x += width;
      }
      x = 0;
      y += height;
    }

    // convert image from image package to Image Widget to display
    List<Image> output = <Image>[];
    for (var img in parts) {
      output.add(
        Image.memory(imglib.encodeJpg(img) as Uint8List),
      );
    }
    return output;
  }
}
