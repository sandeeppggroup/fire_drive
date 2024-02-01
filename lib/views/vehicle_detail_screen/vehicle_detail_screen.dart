// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:fire_drive/views/add_driver_screen/widgets/image_picker_box.dart';
import 'package:fire_drive/views/vehicle_detail_screen/widgets/detail_Screen_image_box.dart';
import 'package:fire_drive/views/widgets/custom_appbar_second.dart';
import 'package:fire_drive/views/widgets/shadow.dart';
import 'package:flutter/material.dart';

class VehicleDetailScreen extends StatelessWidget {
  final image;
  final model;
  final color;
  final wheelType;
  final manifacturingYear;

  const VehicleDetailScreen(
      {this.image,
      this.model,
      this.color,
      this.wheelType,
      this.manifacturingYear,
      super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double textHeight = height * 0.07;
    TextStyle style =
        const TextStyle(fontSize: 17, fontWeight: FontWeight.bold);
    return Scaffold(
      body: Column(
        children: [
          CustomAppbar(
            isAddCar: false,
            title: const Text(
              'Vehicle Details',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(),
          const DetailScreenImageBox(),
          const Divider(),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Model',
                      style: style,
                    ),
                    SizedBox(
                      height: textHeight,
                    ),
                    Text(
                      'color',
                      style: style,
                    ),
                    SizedBox(
                      height: textHeight,
                    ),
                    Text(
                      'Wheel Type',
                      style: style,
                    ),
                    SizedBox(
                      height: textHeight,
                    ),
                    Text(
                      'Manifacturing Year',
                      style: style,
                    ),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(':  Polo Highline petrol', style: style),
                    SizedBox(
                      height: textHeight,
                    ),
                    Text(':  Red', style: style),
                    SizedBox(
                      height: textHeight,
                    ),
                    Text(':  Allow wheel', style: style),
                    SizedBox(
                      height: textHeight,
                    ),
                    Text(':  2013', style: style),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
