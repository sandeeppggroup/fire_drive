import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddVehicleProvider extends ChangeNotifier {
  TextEditingController modelController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController whealTypeController = TextEditingController();
  TextEditingController manufacturingYearController = TextEditingController();
  File? _selectedimage;

  File? get image => _selectedimage;

  void setImage(File image) {
    _selectedimage = image;
    notifyListeners();
  }

  Future getImage(ImageSource imageSource) async {
    final image = await ImagePicker().pickImage(source: imageSource);
    if (image == null) return;
    setImage(File(image.path));
  }
}
