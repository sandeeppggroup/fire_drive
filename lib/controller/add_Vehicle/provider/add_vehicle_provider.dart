// ignore_for_file: use_build_context_synchronously

import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_drive/model/vehicle_model/vehicle_model.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class AddAndGetVehicleDetails extends ChangeNotifier {
  TextEditingController modelController = TextEditingController();
  TextEditingController colorController = TextEditingController();
  TextEditingController whealTypeController = TextEditingController();
  TextEditingController manufacturingYearController = TextEditingController();
  File? _selectedimage;

  File? get image => _selectedimage;

  final firestore = FirebaseFirestore.instance;
  final firestorage = FirebaseStorage.instance;

  // This is using for update the image in UI
  void setImage(File image) {
    _selectedimage = image;
    notifyListeners();
  }

  // This is using for get image from device local storage
  Future getImage(ImageSource imageSource) async {
    final image = await ImagePicker().pickImage(source: imageSource);
    if (image == null) return;
    setImage(File(image.path));
  }

  // This function is using for add image to firestore and will get url from firestore.
  Future<String> storeFile(File image) async {
    String timestamp = DateTime.now().millisecondsSinceEpoch.toString();
    Reference ref = firestorage.ref().child('images').child(timestamp);

    UploadTask uploadTask = ref.putFile(image);
    TaskSnapshot snap = await uploadTask;
    String downloadUrl = await snap.ref.getDownloadURL();
    return downloadUrl;
  }

  // This function is using for add vehicle details to firestore
  Future<void> addFirestore(BuildContext context) async {
    String Url = await storeFile(_selectedimage!);
    var data = VechileModel(
      image: Url,
      color: colorController.text,
      model: modelController.text,
      wheelType: whealTypeController.text,
      manufactureYear: manufacturingYearController.text,
    );
    try {
      await firestore.collection('vehicles').doc().set(data.toMap());
      Fluttertoast.showToast(msg: "Data added successfully");
      Navigator.pop(context);
    } catch (e) {
      Fluttertoast.showToast(msg: 'something went wrong');
      return;
    }
  }

  // This function is using for get vehicle details from firestore
  Stream<List<VechileModel>> getData() {
    return firestore.collection('vehicles').snapshots().map(
      (QuerySnapshot querySnapshot) {
        List<VechileModel> vechiles = [];
        querySnapshot.docs.forEach((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data() as Map<String, dynamic>;
          vechiles.add(VechileModel.fromMap(data));
        });
        return vechiles;
      },
    );
  }
}
