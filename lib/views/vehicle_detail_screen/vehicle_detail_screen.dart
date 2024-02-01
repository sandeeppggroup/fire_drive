// ignore_for_file: prefer_typing_uninitialized_variables, prefer_const_constructors_in_immutables

import 'package:fire_drive/views/vehicle_detail_screen/widgets/detail_Screen_image_box.dart';
import 'package:fire_drive/views/widgets/custom_appbar_second.dart';
import 'package:flutter/material.dart';

class VehicleDetailScreen extends StatelessWidget {
  final image;
  final model;
  final color;
  final wheelType;
  final manifacturingYear;

  VehicleDetailScreen(
      {this.image,
      this.model,
      this.color,
      this.wheelType,
      this.manifacturingYear,
      super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;

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
          DetailScreenImageBoxWidget(
            image: image,
          ),
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
                    Text(':  $model', style: style),
                    SizedBox(
                      height: textHeight,
                    ),
                    Text(':  $color', style: style),
                    SizedBox(
                      height: textHeight,
                    ),
                    Text(':  $wheelType', style: style),
                    SizedBox(
                      height: textHeight,
                    ),
                    Text(':  $manifacturingYear', style: style),
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
