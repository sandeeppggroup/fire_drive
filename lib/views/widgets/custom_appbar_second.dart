// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  final Widget title;
  final Widget? leading;
  bool isAddCar = false;
  CustomAppbar(
      {required this.isAddCar, required this.title, this.leading, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: title,
      ),
      centerTitle: false,
      toolbarHeight: 90,
      iconTheme: const IconThemeData(color: Colors.white),
      leading: leading,
      actions: [
        isAddCar
            ? Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/add_driver_screen');
                      },
                      child: const Text('Add Car'),
                    ),
                  ),
                ],
              )
            : const SizedBox(),
      ],
    );
  }
}
