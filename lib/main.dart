import 'package:fire_drive/views/add_driver_screen/add_driver_screen.dart';
import 'package:fire_drive/views/home_screen/hoem_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const HomeScreen(),
        '/add_driver_screen': (context) => const AddDriverScreen(),
      },
    );
  }
}
