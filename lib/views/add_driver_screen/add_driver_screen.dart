// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:fire_drive/controller/add_Vehicle/provider/add_vehicle_provider.dart';
import 'package:fire_drive/views/add_driver_screen/widgets/image_picker_box.dart';
import 'package:fire_drive/views/widgets/custom_button.dart';
import 'package:fire_drive/views/widgets/custom_appbar_second.dart';
import 'package:fire_drive/views/widgets/custom_text_form.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AddDriverScreen extends StatelessWidget {
  const AddDriverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final addVehicleProvider =
        Provider.of<AddAndGetVehicleDetails>(context, listen: false);

    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppbar(
              isAddCar: false,
              title: const Text(
                'Add Vehicle',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              leading: IconButton(
                onPressed: () {
                  log('message');
                  Navigator.pop(context);
                },
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
              ),
            ),
            const Divider(),
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: height * 0.01,
                  ),
                  const ImagePickerBoxWidget(),
                  SizedBox(
                    height: height * 0.01,
                  ),
                  const Text(
                    'Add Vehicle Image',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey),
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  CustomTextForm(
                      label: 'Enter Vehicle Model',
                      controller: addVehicleProvider.modelController),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  CustomTextForm(
                    label: 'Enter Vehicle Color',
                    controller: addVehicleProvider.colorController,
                  ),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  CustomTextForm(
                      label: 'Enter Wheel Type',
                      controller: addVehicleProvider.whealTypeController),
                  SizedBox(
                    height: height * 0.02,
                  ),
                  CustomTextForm(
                      label: 'Enter Manifacturing Year',
                      controller:
                          addVehicleProvider.manufacturingYearController),
                  SizedBox(
                    height: height * 0.04,
                  ),
                  CustomButton(
                    label: 'Save',
                    onPressed: () async {
                      addVehicleProvider.addFirestore(context);
                      showDialog(
                        context: context,
                        builder: (context) {
                          return const Center(
                            child: CircularProgressIndicator(
                              backgroundColor: Color.fromARGB(255, 208, 23, 10),
                              color: Colors.amber,
                              strokeWidth: 6,
                              strokeAlign: 3,
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
