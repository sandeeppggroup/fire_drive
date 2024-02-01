import 'package:fire_drive/controller/add_Vehicle/provider/add_vehicle_provider.dart';
import 'package:fire_drive/firebase_options.dart';
import 'package:fire_drive/views/add_driver_screen/add_driver_screen.dart';
import 'package:fire_drive/views/home_screen/home_screen.dart';
import 'package:fire_drive/views/vehicle_detail_screen/vehicle_detail_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AddVehicleProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const HomeScreen(),
          '/add_driver_screen': (context) => const AddDriverScreen(),
          '/vehicle_detail_screen': (context) => VehicleDetailScreen(),
        },
      ),
    );
  }
}
