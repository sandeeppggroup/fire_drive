import 'package:fire_drive/views/home_screen/widgets/car_detail_card.dart';
import 'package:fire_drive/views/widgets/custom_appbar_second.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          CustomAppbar(
            isAddCar: true,
            title: const Text(
              'Rentals',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
            ),
          ),
          const Divider(),
          const CarDetailCardWidget()
        ],
      ),
    );
  }
}
