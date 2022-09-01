import 'dart:io';

import 'package:image_picker/image_picker.dart';

class MyService {
  Future<File> processTakePhoto({required ImageSource imageSource}) async {
    var result = await ImagePicker().pickImage(
      source: imageSource,
      maxWidth: 800,
      maxHeight: 800,
    );
    return File(result!.path);
  }
}
