import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';

void showSnackBar({required BuildContext context, required String content}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}

Future pickImage(BuildContext context) async {
  File? imageF;
  try {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    imageF = File(image.path);
  } on Exception catch (e) {
    showSnackBar(context: context, content: e.toString());
  }
  return imageF;
}
