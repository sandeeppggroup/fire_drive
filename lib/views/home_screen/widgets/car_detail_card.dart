import 'package:fire_drive/views/vehicle_detail_screen/vehicle_detail_screen.dart';
import 'package:flutter/material.dart';

class CarDetailCard extends StatelessWidget {
  const CarDetailCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const VehicleDetailScreen(),
                    ));
              },
              child: Card(
                child: ListTile(
                  title: const Text('Model : Maruthi Suzuki',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
                  subtitle: const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Color: Grey',
                        style:
                            TextStyle(color: Color.fromARGB(255, 99, 97, 97)),
                      ),
                      Text('Wheel Type: Allow weel',
                          style: TextStyle(
                              color: Color.fromARGB(255, 99, 97, 97))),
                      Text('Manufacturing Year: 2020',
                          style: TextStyle(
                              color: Color.fromARGB(255, 99, 97, 97))),
                    ],
                  ),
                  trailing: Image.asset('assets/images/swift.png'),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
