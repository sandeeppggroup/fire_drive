import 'package:fire_drive/controller/add_Vehicle/provider/add_vehicle_provider.dart';
import 'package:fire_drive/model/vehicle_model/vehicle_model.dart';
import 'package:fire_drive/views/vehicle_detail_screen/vehicle_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CarDetailCardWidget extends StatelessWidget {
  const CarDetailCardWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
        stream: Provider.of<AddAndGetVehicleDetails>(context).getData(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No vechiles available.'));
          } else {
            List<VechileModel> vehicles = snapshot.data!;
            return ListView.builder(
              itemCount: vehicles.length,
              itemBuilder: (context, index) {
                VechileModel vehicle = vehicles[index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => VehicleDetailScreen(
                              image: vehicle.image,
                              model: vehicle.model,
                              color: vehicle.color,
                              wheelType: vehicle.wheelType,
                              manifacturingYear: vehicle.manufactureYear,
                            ),
                          ));
                    },
                    child: Card(
                      child: ListTile(
                        title: Text('Model :${vehicle.model}',
                            style: const TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w500)),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Color: ${vehicle.color}',
                              style: const TextStyle(
                                  color: Color.fromARGB(255, 99, 97, 97)),
                            ),
                            Text('Wheel Type: ${vehicle.wheelType}',
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 99, 97, 97))),
                            Text(
                                'Manufacturing Year: ${vehicle.manufactureYear}',
                                style: const TextStyle(
                                    color: Color.fromARGB(255, 99, 97, 97))),
                          ],
                        ),
                        trailing: Image.network(vehicle.image),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
